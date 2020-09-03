extends Area2D

var currDoorClosed
var doorKey

onready var button = get_parent().get_node("OpenDoorBtn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	button.hide()
	doorKey = get_parent().doorKey


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	#print(doorKey)
	if Inventory.keys.has(doorKey) || doorKey == "":
		currDoorClosed = get_parent().doorClosed
		if currDoorClosed:
			button.text = "Open"
		else:
			button.text = "Close"
		button.show()
	else:
		pass

func _on_Area2D_area_exited(area):
	button.hide()

func _on_OpenDoorBtn_pressed():
	if is_network_master():
		rpc("_toggleDoor")

remotesync func _toggleDoor():
	get_parent()._closeDoor(!currDoorClosed)
	currDoorClosed = not currDoorClosed
	if currDoorClosed:
		button.text = "Open"
	else:
		button.text = "Close"

func _on_Area2D_mouse_entered():
	_on_Area2D_area_entered(null)


func _on_Area2D_mouse_exited():
	_on_Area2D_area_exited(null)
