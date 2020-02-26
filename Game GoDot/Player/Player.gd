extends KinematicBody2D

# Player movement speed
export var speed = 400

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
	
	var movement = speednew * direction * delta
	move_and_collide(movement)
