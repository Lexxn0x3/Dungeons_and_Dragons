extends Node2D


# Declare member variables here. Examples:
var strength


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var race = get_node("Race Menu/ItemList").racetemp
	
	if(race == 0):
		$"Race-Info/Panel/Name".text = "Dragonborn"
	pass
