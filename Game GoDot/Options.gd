extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label/CheckButton").pressed = get_parent()._read_ConfigFile("Graphics", "Fullscreen")
	get_node("Label2/CheckButton").pressed = get_parent()._read_ConfigFile("Audio", "MusicPlaying")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Fullscreen_CheckButton_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
	get_parent()._set_ConfigFile("Graphics", "Fullscreen", button_pressed)



func _on_Music_CheckButton_toggled(button_pressed):
	get_parent().get_node("AudioStreamPlayer").set_stream_paused(!button_pressed)# !becouse of sptopped not playing
	get_parent()._set_ConfigFile("Audio", "MusicPlaying", button_pressed)
