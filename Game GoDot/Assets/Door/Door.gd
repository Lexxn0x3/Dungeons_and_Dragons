extends Node2D
tool

export(bool) var doorClosed = true setget _closeDoor
export(int, "Door Closed 1", "Door Closed 2", "Door Closed Vertical 1", \
 "Door Closed Vertical 2", "Door Closed Vertical 3") var doorSelection setget _setDoorSelection
export(float) var doorScale = 2 setget _setScale
export(String) var doorKey setget _key

onready var doorClosed1 = get_node("Door Closed 1")
onready var doorClosed2 = get_node("Door Closed 2")
onready var doorClosedVertical1 = get_node("Door Closed Vertical 1")
onready var doorClosedVertical2 = get_node("Door Closed Vertical 2")
onready var doorClosedVertical3 = get_node("Door Closed Vertical 3")


# Called when the node enters the scene tree for the first time.
func _ready():
	_showDoor(doorSelection)
	_setScale(doorScale)

func _key(curKey):
	doorKey = curKey

func _setDoorSelection(selection):
	doorSelection = selection
	_showDoor(selection)

func _closeDoor(closed):
	doorClosed = closed
	_showDoor(doorSelection)

func _setScale(scale):
	doorScale = scale
	property_list_changed_notify() 
	self.scale = Vector2(scale, scale)

func _getVisibility(selection, door):
	if selection == door:
		return(true)
	else:
		return(false)

func _setVisibility(visible, closed, collision, lightOccluder, doorOpen, doorClosed):
	if visible:
		if closed:
			collision.collision_layer = 1
			collision.collision_mask = 1
			lightOccluder.visible = true
			doorClosed.show()
			doorOpen.hide()
		else:
			collision.collision_layer = 18
			collision.collision_mask = 18
			lightOccluder.visible = false
			doorOpen.show()
			doorClosed.hide()
	else:
		#collision.set_deferred()
		collision.collision_layer = 18
		collision.collision_mask = 18
		lightOccluder.visible = false
		doorClosed.hide()
		doorOpen.hide()

func _showDoor(selection):
	_door1(doorClosed, _getVisibility(doorSelection, 0))
	_door2(doorClosed, _getVisibility(doorSelection, 1))
	_doorVertical1(doorClosed, _getVisibility(doorSelection, 2))
	_doorVertical2(doorClosed, _getVisibility(doorSelection, 3))
	_doorVertical3(doorClosed, _getVisibility(doorSelection, 4))

func _door1(closed, visible):
	_setVisibility(visible,closed, $"Door Closed 1", \
	$"Door Closed 1/LightOccluder2D",$"Door Closed 1/SpriteOpen",$"Door Closed 1/SpriteClosed")

func _door2(closed, visible):
	_setVisibility(visible,closed,$"Door Closed 2", \
	$"Door Closed 2/LightOccluder2D",$"Door Closed 2/SpriteOpen",$"Door Closed 2/SpriteClosed")

func _doorVertical1(closed, visible):
	_setVisibility(visible,closed,$"Door Closed Vertical 1", \
	$"Door Closed Vertical 1/LightOccluder2D",$"Door Closed Vertical 1/SpriteOpen",$"Door Closed Vertical 1/SpriteClosed")

func _doorVertical2(closed, visible):
	_setVisibility(visible,closed,$"Door Closed Vertical 2", \
	$"Door Closed Vertical 2/LightOccluder2D",$"Door Closed Vertical 2/SpriteOpen",$"Door Closed Vertical 2/SpriteClosed")

func _doorVertical3(closed, visible):
	_setVisibility(visible,closed,$"Door Closed Vertical 3", \
	$"Door Closed Vertical 3/LightOccluder2D",$"Door Closed Vertical 3/SpriteOpen",$"Door Closed Vertical 3/SpriteClosed")
