extends StaticBody2D
tool

export var SideTorch = false
export var FlipHorizontal = false
export var EditorOn = true
export var NoSprite = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _enter_tree():
	get_node("Light2D").hide()
	if NoSprite == true:
		get_node("Torch").hide()
		get_node("Side Torch").hide()
	if SideTorch:
		get_node("Torch").hide()
		get_node("Side Torch").show()
	else:
		get_node("Torch").show()
		get_node("Side Torch").hide()
	if FlipHorizontal:
		get_node("Side Torch").flip_h = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.editor_hint:
		_turnOn(EditorOn)
		if FlipHorizontal == true:
			get_node("Side Torch").flip_h = true
		else:
			get_node("Side Torch").flip_h = false
		if NoSprite == true:
			get_node("Torch").hide()
			get_node("Side Torch").hide()
		else:
			if SideTorch:
				get_node("Torch").hide()
				get_node("Side Torch").show()
			else:
				get_node("Torch").show()
				get_node("Side Torch").hide()


func _on_Area2D_body_entered(body):
	get_node("Light2D").show()

func _turnOn(on):
	if on == true:
		get_node("Light2D").show()
	else:
		get_node("Light2D").hide()
