extends Control
#signal hitPlay

onready var itemList = get_node("ItemList")
var optionsShown = false
var optionsScene = load("res://Options.tscn")
var options
var playerScene = load("res://Player/Player.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	itemList.hide()
	$CheckBox.hide()
# warning-ignore:return_value_discarded
	get_tree().connect("network_peer_connected", self, "_player_connected")
# warning-ignore:return_value_discarded
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
# warning-ignore:return_value_discarded
	get_tree().connect("connected_to_server", self, "_connected_ok")
# warning-ignore:return_value_discarded
	get_tree().connect("connection_failed", self, "_connected_fail")
# warning-ignore:return_value_discarded
	get_tree().connect("server_disconnected", self, "_server_disconnected")
#
#	if get_parent()._read_ConfigFile("Graphics", "Fullscreen") == true||false:
#		OS.window_fullscreen = get_parent()._read_ConfigFile("Graphics", "Fullscreen")

# warning-ignore:unused_argument
func _process(delta):
	_updateUI()


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


func _on_Create_pressed():
	Network._initializeServer(Network.DEFAULT_PORT, Network.MAX_PLAYERS)
	#get_node("Network/ItemList").add_item(String(get_tree().get_network_unique_id()))
	Network.player_info[1] = get_node("Network/TextEdit").get_line(0)

func _player_connected(id):
	
	#get_node("Network/ItemList").add_item(String(id))
	
	#sends info to all players (func: register_player)
	rpc_id(id, "register_player", get_node("Network/TextEdit").get_line(0))
	
	
	#get_node("Network/ItemList").add_item(player_info.get(id))

func _player_disconnected(id):
#	for i in range(get_node("Network/ItemList").get_item_count()):
#		if get_node("Network/ItemList").get_item_text(i) == player_info[id]:
#			get_node("Network/ItemList").remove_item(i)
#			print("disconeccted: " + id)
	Network.player_info.erase(id)

func _connected_ok():
	print("Connection Successfull")

func _server_disconnected():
	print("Server Kicked")
	Network.player_info.clear()

func _connected_fail():
	print("Connection failed :(")
	Network.player_info.clear()

func _on_Join_pressed():
	Network.player_info.clear()
	Network._initializeClient(Network.DEFAULT_IP, Network.DEFAULT_PORT)
	Network.player_info[get_tree().get_network_unique_id()] = get_node("Network/TextEdit").get_line(0)
#	get_node("Network/ItemList").clear()
#	#get_node("Network/ItemList").add_item(String(get_tree().get_network_unique_id()))
#	get_node("Network/ItemList").add_item(get_node("Network/TextEdit").get_line(0))

remote func register_player(info):
	# Get the id of the RPC sender.
	var id = get_tree().get_rpc_sender_id()
	# Store the info
	Network.player_info[id] = info
	
#	print(player_info[id])
#	print(player_info.size())

func _updateUI():
	var keys = Network.player_info.keys()
	get_node("Network/ItemList").clear()
	for i in range(keys.size()):
		get_node("Network/ItemList").add_item(Network.player_info[keys[i]])
		#print(keys)


func _on_StartServer_pressed():
	var List = get_node("ItemList")
	if get_tree().is_network_server() == true:
		#get_parent()._muliplayer_game(List.get_item_text(List.get_selected_items()))
		rpc_id(1, "_muliplayer_game")
