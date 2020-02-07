extends Camera2D
var zoomValue = Vector2(1, 1)

# Called when the node enters the scene tree for the first time.
func _ready():
	zoomValue.x = 1
	zoomValue.y = 1

func _physics_process(delta):
	#get Inputs
	#if Input.is_action_pressed"camera_zoom_in"):
		zoomValue.x += 1
	#if Input.is_action_pressed("camera_zoom_out"):
	#zoomValue.x -= 1
	#zoomValue.y = zoomValue.x
	#if OS.is_debug_build(): print(zoomValue.x)
	#set Zoom
	#set_zoom(Vector2(zoomValue.x, zoomValue.y))
	#set_zoom(zoomValue)
