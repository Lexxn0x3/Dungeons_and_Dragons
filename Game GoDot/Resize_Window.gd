extends Node

var width
var height
var width_old
var height_old
var window_proportion


# Called when the node enters the scene tree for the first time.
func _ready():
	width = OS.get_screen_size(OS.current_screen)[0]
	height = OS.get_screen_size(OS.current_screen)[1]
	width_old = width
	height_old = height
	window_proportion = OS.get_screen_size(OS.current_screen)[0]/OS.get_screen_size(OS.current_screen)[1]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !OS.window_fullscreen:
		width = OS.get_window_size()[0]
		height = OS.get_window_size()[1]
		if width != width_old:
			height = width / window_proportion
		if height != height_old:
			width = window_proportion * height
		OS.set_window_size(Vector2(width, height))
		width_old = width
		height_old = height
	pass

	


