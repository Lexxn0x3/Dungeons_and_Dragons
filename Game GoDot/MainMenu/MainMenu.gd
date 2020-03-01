extends Control
signal hitPlay

onready var itemList = get_node("ItemList")
var optionsShown = false
var optionsScene = load("res://Options.tscn")
var options



# Called when the node enters the scene tree for the first time.
func _ready():
	itemList.hide()
	$CheckBox.hide()
#
#	if get_parent()._read_ConfigFile("Graphics", "Fullscreen") == true||false:
#		OS.window_fullscreen = get_parent()._read_ConfigFile("Graphics", "Fullscreen")

func _process(delta):
	pass

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


func _on_create_Button2_pressed():
	Network.create_server()
	print(get_tree().get_network_unique_id())


func _on_connect_Button_pressed():
	Network.connect_to_server()
	print(get_tree().get_network_unique_id())

func _on_Name_LineEdit_text_changed(new_text):
	Network.my_info.name = new_text
