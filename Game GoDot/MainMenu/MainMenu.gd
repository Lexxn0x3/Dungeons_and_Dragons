extends Control
signal hitPlay

onready var itemList = get_node("ItemList")



# Called when the node enters the scene tree for the first time.
func _ready():
	itemList.hide()
	$CheckBox.hide()
	
	if _read_ConfigFile("Graphics", "Fullscreen") == true||false:
		OS.window_fullscreen = _read_ConfigFile("Graphics", "Fullscreen")

func _process(delta):
	pass

func switch_Menu_visibility():
	if $MarginContainer/HBoxContainer/VBoxContainer/Start.is_visible_in_tree():
		$MarginContainer/HBoxContainer/VBoxContainer/Start.hide()
		$MarginContainer/HBoxContainer/VBoxContainer/Map.hide()
		$MarginContainer/HBoxContainer/VBoxContainer/Options.hide()
		$MarginContainer/HBoxContainer/VBoxContainer/Quit.hide()
		print("hide")
	else:
		$MarginContainer/HBoxContainer/VBoxContainer/Start.show()
		$MarginContainer/HBoxContainer/VBoxContainer/Map.show()
		$MarginContainer/HBoxContainer/VBoxContainer/Options.show()
		$MarginContainer/HBoxContainer/VBoxContainer/Quit.show()
		print("show")

#untile here all Menu button funktions of the MainMenu
func _on_Start_pressed():
	emit_signal("hitPlay")


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
		_set_ConfigFile("Graphics", "Fullscreen", false)
	else:
		_set_ConfigFile("Graphics", "Fullscreen", true)
	#print(OS.window_fullscreen)

func _on_Options_pressed():
	if $CheckBox.is_visible_in_tree():
		$CheckBox.hide()
	else:
		$CheckBox.show()
		
		
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
		return (config.get_value(section, key))                                 #gets value form the file and returns it
