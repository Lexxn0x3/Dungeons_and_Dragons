extends Node

var mapScene
var map
var playerScene = load("res://Player/Player.tscn")
var player
var optionsShown = false
var optionsScene = load("res://Options.tscn")
var options
var mainMenu

#Esc Menu
var EscMenu = load("res://EscMenu.tscn")
var menu

var playing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var config = ConfigFile.new()                                               #creates config file in case
	var err = config.load("user://settings.cfg")                                #it dosent exist already
	if err == 7:
		config.save("user://settings.cfg") 
	_instance_MainMenu()
	
	if _read_ConfigFile("Graphics", "Fullscreen") == true||false:
		OS.window_fullscreen = _read_ConfigFile("Graphics", "Fullscreen")
	
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('server_disconnected', self, '_on_server_disconnected')
	
	var new_player = preload('res://Player/Player.tscn').instance()
	new_player.name = str(get_tree().get_network_unique_id())
	new_player.set_network_master(get_tree().get_network_unique_id())
	add_child(new_player)
	var info = Network.self_data
	new_player.init(info.name, info.position, false)

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

func _on_MainMenu_hitPlay():
	player = playerScene.instance()
	var item = mainMenu.get_selected_map()
	if item != PoolIntArray():
		if item == PoolIntArray([0]):
			mapScene = load("res://Maps/The Dark Pit of Gothmog of Udun/The Dark Pit of Gothmog of Udun.tscn")
		if item == PoolIntArray([1]):
			mapScene = load("res://Maps/The Warrens of Tenebrous/The Warrens of Tenebrous.tscn")
		map = mapScene.instance()
		add_child(map)
		add_child(player)
		mainMenu.queue_free()
		playing = true
		if optionsShown == true:
			options.queue_free()
			optionsShown = false

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
	
func _queue_free_player_map_escMenu_options():
	player.queue_free()
	menu.queue_free()
	map.queue_free()
	mainMenu.queue_free()

func _on_player_disconnected(id):
	get_node(str(id)).queue_free()

func _on_server_disconnected():
	get_tree().change_scene('res://MainMenu/MainMenu.tscn')
