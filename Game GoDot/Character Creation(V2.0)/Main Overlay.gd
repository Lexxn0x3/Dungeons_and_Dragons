extends Node2D


onready var CC = $Character_Creator
onready var Infos = $Info_Pannel
onready var Button1 = $Button

var show_infos = true
var temp_size
var button1_pressed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	CC.rect_size = Vector2(OS.get_real_window_size()[0]*2/3, OS.get_real_window_size()[1])
	Infos.rect_position = Vector2(OS.get_real_window_size()[0]*2/3,0)
	Infos.rect_size = Vector2(OS.get_real_window_size()[0]*1/3, OS.get_real_window_size()[1])
	temp_size = Button1.rect_size
	Button1.rect_position = Vector2(OS.get_real_window_size()[0]-temp_size[0]-5,5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button1_pressed:
		if show_infos:
			CC.rect_size = Vector2(OS.get_real_window_size()[0]*2/3, OS.get_real_window_size()[1])
			Infos.visible = true
		else:
			CC.rect_size = OS.get_real_window_size()
			Infos.visible = false
		update()
		button1_pressed = false
	pass



func _on_InfoScreen_toggle_signal():
	show_infos = !show_infos
	button1_pressed = true
	pass # Replace with function body.
