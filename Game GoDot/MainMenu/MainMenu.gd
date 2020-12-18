extends Control
#signal hitPlay

#onready var itemList = get_node("ItemList")
onready var itemList = get_node("Create Game/Map Button")
onready var networkNodes = get_node("Network")
var optionsShown = false
var optionsScene = load("res://Options.tscn")
var options
var playerScene = load("res://Player/Player.tscn")

var ip_address
var player_name


# Called when the node enters the scene tree for the first time.
func _ready():
	#itemList.hide()
	pass

# warning-ignore:unused_argument
func _process(delta):
	_updatePlayerList()


#untile here all Menu button funktions of the MainMenu

#func _on_Quit_pressed():
#	pass # Replace with function body.
#	get_tree().quit()


#func _on_Map_pressed():
#	if itemList.is_visible_in_tree():
#		itemList.hide()
#	else:
#		itemList.show()

#func get_selected_map():
#	return(itemList.get_selected_items())


func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	if OS.window_fullscreen == false:
		get_parent()._set_ConfigFile("Graphics", "Fullscreen", false)
	else:
		get_parent()._set_ConfigFile("Graphics", "Fullscreen", true)
	#print(OS.window_fullscreen)

#func _on_Options_pressed():
#	get_parent()._instance_options()                                            #calls the funktion _instance_optons from the MainScene                           #gets value form the file and returns it

func _updatePlayerList():
	var player_list1 = get_node("Create Game/ItemList")
	var player_list2 = get_node("Play Online/ItemList")
	
	player_list1.clear()
	player_list2.clear()
	
	for p in Network.player_info:
		player_list1.add_item(Network.player_info[p].name)
		player_list2.add_item(Network.player_info[p].name)


#func _on_Join_pressed():
#	print("connect...")
#	var playerName = get_node("Network/VBoxContainer/TextEdit").text
#	if playerName == "":
#		print("no player name")
#		return
#	print(Network.connect_to_server(playerName, ip_address))


#func _on_Create_pressed():
#	var playerName = get_node("Network/VBoxContainer/TextEdit").text
#	if playerName == "":
#		return
#	Network.create_server(playerName)


#func _on_StartServer_pressed():
#	if is_network_master():
#		var map = itemList.get_selected_items()
#		if map != PoolIntArray():
#			rpc("StartServer", itemList.get_selected_items())
#			get_tree().refuse_new_network_connections = true;
#	else:
#		pass

remotesync func StartServer(map):
	get_parent()._on_Server_hitPlay(map)

func _on_StartMuliplayer_pressed():
	if networkNodes.is_visible_in_tree():
		networkNodes.hide()
	else:
		networkNodes.show()


#func _on_Server_ip_text_changed():
#	ip_address = get_node("Network/VBoxContainer/Server ip").text


func _on_Play_Online_pressed():
	get_node("Main Menu").hide()
	get_node("Play Online").show()


func _on_Back_pressed():
	get_node("Main Menu").show()
	get_node("Play Online").hide()
	get_node("Create Game").hide()
	get_node("Player Settings").hide()
	get_node("Game Settings").hide()


func _on_Create_Game_pressed():
	#Create Server
	var playerName = get_node("Player Settings/Playername").text
	if playerName == "":
		return
	Network.create_server(playerName)
	#Done
	get_node("Main Menu").hide()
	get_node("Create Game").show()


func _on_Player_Settings_pressed():
	get_node("Main Menu").hide()
	get_node("Player Settings").show()


func _on_Game_Settings_pressed():
	get_node("Main Menu").hide()
	get_node("Game Settings").show()


func _on_Exit_Game_pressed():
	get_tree().quit()


func _on_Start_Game_pressed():
	if is_network_master():
		
		rpc("StartServer", itemList.get_selected_id())
		get_tree().refuse_new_network_connections = true;
		
	else:
		pass


func _on_Join_Game_pressed():
	print("connect...")
	if player_name == "":
		return
	print(Network.connect_to_server(player_name, ip_address))


func _on_Playername_text_changed(new_text):
	player_name = new_text
	get_parent()._set_ConfigFile("PlayerSettings", "Playername", player_name)


func _on_IP_Adress_text_changed(new_text):
	ip_address = new_text


func _on_Map_Button_toggled(button_pressed):
	if button_pressed and get_node("Create Game/HSeparator2").get("custom_constants/separation") == 0:
		
		#get_node("Create Game/MarginContainer").rect_min_size = Vector2(0,150)
		#get_node("Create Game/HSeparator2").set("custom_constants/separation", 150)
		#get_node("Create Game/Map Button").hide()
		#get_node("Create Game/Map Button").draw
		pass
	else:
		#get_node("Create Game/HSeparator2").set("custom_constants/separation", 0)
		pass


func _on_Playername_ready():
	if get_parent()._read_ConfigFile("PlayerSettings", "Playername") != null:
		get_node("Player Settings/Playername").text = get_parent()._read_ConfigFile("PlayerSettings", "Playername")


func _on_Map_Button_ready():
	pass
