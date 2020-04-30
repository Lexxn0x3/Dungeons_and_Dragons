extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label/CheckButton").pressed = get_parent()._read_ConfigFile("Graphics", "Fullscreen")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Fullscreen_CheckButton_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
	get_parent()._set_ConfigFile("Graphics", "Fullscreen", button_pressed)

