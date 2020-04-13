extends Control

onready var CC = $"Caracter Creator"
onready var Info = $"Info-Screen"
onready var Wall = $Wall

var mouseinwall = false
var Windowsize = OS.get_real_window_size()


func _ready():
	CC.rect_size = Vector2(Windowsize[0]/2-1,Windowsize[1])
	Info.rect_size = Vector2(Windowsize[0]/2-1,Windowsize[1])
	Info.rect_position = Vector2(Windowsize[0]/2+2,0)
	Wall.rect_size = Vector2(2,Windowsize[1])
	Wall.rect_position = Vector2(Windowsize[0]/2,0)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (Wall.rect_position[0] - 1 <= get_global_mouse_position()[0] && get_global_mouse_position()[0] <= Wall.rect_position[0] + 3):
		mouseinwall = true
	else:
		if not Input.is_action_pressed("Left_Mouse_key"):
			mouseinwall = false
	
	if mouseinwall && Input.is_action_pressed("Left_Mouse_key"):		#Resize Pannels
		var mouse_x = get_global_mouse_position()[0]
		if mouse_x < 0:		#Cant drag out of View
			mouse_x =0 
		if mouse_x > Windowsize[0]:		#Cant drag out of View
			mouse_x = Windowsize[0]
		CC.rect_size = Vector2(mouse_x - 1, CC.rect_size[1])
		Wall.rect_position = Vector2 (mouse_x, Wall.rect_position[1])
		Info.rect_position = Vector2(mouse_x + 1, Info.rect_position[1])
		Info.rect_size = Vector2(Windowsize[0]-Info.rect_position[0],Info.rect_size[1])
		Windowsize = OS.get_window_safe_area().size
	
	
	pass

