tool
extends StaticBody2D

export(String, "Key1", "Key2") var selectedKey setget _setSelectedKey
export(Color, RGBA) var color setget _setColor
export(String) var key

func _setSelectedKey(selection):
	selectedKey = selection
	_showKey(selection)

func _setColor(newColor):
	color = newColor
	_showKey(selectedKey)
# Called when the node enters the scene tree for the first time.
func _ready():
	_showKey(selectedKey)

func _showKey(selection):
	#match selection:
	get_node("AnimatedSprite").animation = selection
	get_node("AnimatedSprite").modulate = color
	
#		0:
#			get_node("AnimatedSprite").animation = "Key1"
#		1:
#			get_node("AnimatedSprite").animation = "Key2"


func _on_Area2D_mouse_entered():
	print("mouse entered")


func _on_Area2D_area_entered(area):
	print("entered script: key.gd")


func _on_Area2D_body_entered(body):
	print("body entered: key.gd")

func _getInformation():
	#print(Inventory.keys)
	return(key)
