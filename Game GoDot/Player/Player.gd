extends KinematicBody2D

# Player movement speed
const speed = 7000

slave var slave_position = Vector2()

#func _enter_tree():
#	self.position.x = 500
#	self.position.y = 500

func _physics_process(delta):
	if is_network_master():
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
		rset_unreliable("slave_position", self.position)
	else:
		self.position = slave_position

func _ready():
	if is_network_master() == false:
		get_node("PlayerName").text = Network.player_info[self.get_network_master()].name


func _on_Area2D3_body_entered(body):
	#print(body._getInformation())
	Inventory.keys.insert(Inventory.keys.size(), body._getInformation())
	#print(Inventory.keys)
	body.queue_free()
