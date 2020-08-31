extends Control
#signal hitPlay

onready var itemList = get_node("ItemList")
onready var networkNodes = get_node("Network")
var optionsShown = false
var optionsScene = load("res://Options.tscn")
var options
var playerScene = load("res://Player/Player.tscn")
var ip_address


# Called when the node enters the scene tree for the first time.
func _ready():
	itemList.hide()

# warning-ignore:unused_argument
func _process(delta):
	_updatePlayerList()


#untile here all Menu button funktions of the MainMenu
func _on_Start_pressed():
	get_parent()._on_MainMenu_hitPlay()


func _on_Quit_pressed():
	pass # Replace with function body.
	get_tree().quit()


func _on_Map_pressed():
	if itemList.is_visible_in_tree():
		itemList.hide()
	else:
		itemList.show()

func get_selected_map():
	return(itemList.get_selected_items())


func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	if OS.window_fullscreen == false:
		get_parent()._set_ConfigFile("Graphics", "Fullscreen", false)
	else:
		get_parent()._set_ConfigFile("Graphics", "Fullscreen", true)
	#print(OS.window_fullscreen)

func _on_Options_pressed():
	get_parent()._instance_options()                                            #calls the funktion _instance_optons from the MainScene                           #gets value form the file and returns it

func _updatePlayerList():
	var list = get_node("Network/ItemList")
	
	list.clear()
	for p in Network.player_info:
		list.add_item(Network.player_info[p].name)


func _on_Join_pressed():
	var playerName = get_node("Network/VBoxContainer/TextEdit").text
	if playerName == "":
		return
	Network.connect_to_server(playerName, ip_address)


func _on_Create_pressed():
	var playerName = get_node("Network/VBoxContainer/TextEdit").text
	if playerName == "":
		return
	Network.create_server(playerName)


func _on_StartServer_pressed():
	rpc("StartServer", itemList.get_selected_items())

remotesync func StartServer(map):
	get_parent()._on_Server_hitPlay(map)

func _on_StartMuliplayer_pressed():
	if networkNodes.is_visible_in_tree():
		networkNodes.hide()
	else:
		networkNodes.show()


func _on_Server_ip_text_changed():
	ip_address = get_node("Network/VBoxContainer/Server ip").text
