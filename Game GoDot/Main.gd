extends Node
var mapScene
var map
var playerScene = preload("res://Player/Player.tscn")
var player
var optionsShown = false
var optionsScene = load("res://Options.tscn")
var options
var mainMenu

#Esc Menu
var EscMenu = load("res://EscMenu.tscn")
var menu

var playing

# Called when the node enters the scene tree for the first time.
func _ready():
	var config = ConfigFile.new()                                               #creates config file in case
	var err = config.load("user://settings.cfg")                                #it dosent exist already
	if err == 7:
		config.save("user://settings.cfg") 
		_set_ConfigFile("Graphics", "Fullscreen", true)
		_set_ConfigFile("Audio", "MusicPlaying", true)
	
	_instance_MainMenu()
	
	#if _read_ConfigFile("Graphics", "Fullscreen") == true||false:
	OS.window_fullscreen = _read_ConfigFile("Graphics", "Fullscreen")
	#if _read_ConfigFile("Audio", "MusicPlaying") == true||false:
	get_node("AudioStreamPlayer").set_stream_paused(!(_read_ConfigFile("Audio", "MusicPlaying")))


func _process(delta):
	pass

func _input(ev):
	if Input.is_action_just_pressed("ui_cancel") && playing == true:
		menu = EscMenu.instance()
		add_child(menu)
		playing = false
		print("add")
	elif Input.is_action_just_pressed("ui_cancel") && playing == false:
		playing = true
		print("remove")
		menu.queue_free()
	else:
		pass

func _on_Server_hitPlay(map):
	var selfPeerID = get_tree().get_network_unique_id()
	var player = preload("res://Player/Player.tscn").instance()
	player.set_name(str(selfPeerID))
	player.set_network_master(selfPeerID)
	if map == 0:
		mapScene = load("res://Maps/The Dark Pit of Gothmog of Udun/The Dark Pit of Gothmog of Udun.tscn")
	if map == 1:
		mapScene = load("res://Maps/The Warrens of Tenebrous/The Warrens of Tenebrous.tscn")
	else:
		print("default map")
		mapScene = load("res://Maps/The Dark Pit of Gothmog of Udun/The Dark Pit of Gothmog of Udun.tscn")
	map = mapScene.instance()
	add_child(map)
	add_child(player)
	mainMenu.queue_free()
	playing = true
	if optionsShown == true:
		options.queue_free()
		optionsShown = false
		mainMenu.queue_free()
	playing = true
	if optionsShown == true:
		options.queue_free()
		optionsShown = false
		
	#other players
	for p in Network.player_info:
		player = preload("res://Player/Player.tscn").instance()
		player.set_name(str(p))
		print(p)
		player.set_network_master(p)
		print(player)
		add_child(player)

func _instance_options():
	if optionsShown == false:
		options = optionsScene.instance()
		add_child(options)
		optionsShown = true
	elif optionsShown == true:
		options.queue_free()
		optionsShown = false

func _set_ConfigFile(section, key, key_value):                                  #funktion to set the ini Config File at C:\Users\User\AppData\Roaming\Godot\app_userdata\Dungeons & Dragons
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")                                #loading config file
	if err == OK: # If not, something went wrong with the file loading
		config.set_value(section, key, key_value)                               #sets the input variables from the funktion
		# Save the changes by overwriting the previous file
		config.save("user://settings.cfg")                                      #saves all the stuff to the fle
		#print("saved")
func _read_ConfigFile(section, key):                                            #funktion to read the ini Config File at C:\Users\User\AppData\Roaming\Godot\app_userdata\Dungeons & Dragons
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")                                #loading config file
	if err == OK: # If not, something went wrong with the file loading
		return (config.get_value(section, key))   
		   
func _instance_MainMenu():
	var mainMenuScene = load("res://MainMenu/MainMenu.tscn")
	mainMenu = mainMenuScene.instance()
	add_child(mainMenu)

#networking disconnecting
func _on_player_disconnected(id):
	get_node(str(id)).queue_free()

func _on_server_disconnected():
	pass
	#return to default Main Menu
	#should be done soon
