extends Camera2D
export var zoomSpeed = 1           #exported variables
export var zoomDefault = 1
export var zoomMax = 4.1
export var zoomMin = 0.1

var zoomValue = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	zoomValue.x = zoomDefault #defaul zoom of the camera
	zoomValue.y = zoomDefault

func _physics_process(delta):
	#get Inputs
	if Input.is_action_pressed("camera_zoom_out"):
		zoomValue.x += zoomSpeed * delta * zoomValue.x * zoomValue.x
		
	if Input.is_action_pressed("camera_zoom_in"):
		zoomValue.x -= zoomSpeed * delta * zoomValue.x * zoomValue.x

	#if OS.is_debug_build(): print(zoomValue.x) #print debug zoom faktor

	zoomValue.x = clamp(zoomValue.x, zoomMin, zoomMax)        #applay max zoom
	zoomValue.y = zoomValue.x             #applay zoom on camera
	set_zoom(zoomValue)
	#is_rotating(true) 
	#Camera2D.rotation_degrees(0.4)
