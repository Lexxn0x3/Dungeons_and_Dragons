extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _quit_Button_pressed():
	get_tree().quit()


func _on_Resume_pressed():
	get_parent().playing = true
	self.queue_free()
	if get_parent().optionsShown == true:
		get_parent()._instance_options()


func _on_Options_pressed():
	get_parent()._instance_options()


func _on_MainMenu_button_pressed():
	get_tree().network_peer = null
	get_parent()._queue_free_player_map_escMenu_options()
	get_parent()._instance_MainMenu()
	get_parent().playing = false
