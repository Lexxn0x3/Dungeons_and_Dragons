extends KinematicBody2D

# Player movement speed
const speed = 10000

func _enter_tree():
	self.position.x = 500
	self.position.y = 500

func _physics_process(delta):
	# Get player input
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	# Apply movement
	var speednew
	if(Input.is_action_pressed("walk_slow")):
		speednew = speed/5
	else:
		speednew = speed
	#speed = 1000
	var movement = speednew * direction * delta
	move_and_slide(movement)
