extends Node2D


var strength_modifier = 0
var dexterity_modifier = 0
var constitution_modifier = 0
var intelligence_modifier = 0
var wisdom_modifier = 0
var charisma_modifier = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var race = get_node("Race Menu/ItemList").racetemp
	_update_modifiers()
	
	if(race == 0):
		$"Race-Info/Panel/Name".text = "Dragonborn"
		strength_modifier = 2 
	pass


func _update_modifiers():
	if(strength_modifier == 0):
		$"Race-Info/Panel/Modifiers_text/Strength/Modifier".text = "0"
	else:
		$"Race-Info/Panel/Modifiers_text/Strength/Modifier".text = str("+",strength_modifier)
	if(dexterity_modifier == 0):
		$"Race-Info/Panel/Modifiers_text/Dexterity/Modifier".text = "0"
	else:
		$"Race-Info/Panel/Modifiers_text/Dexterity/Modifier".text = str("+",dexterity_modifier)
	if(constitution_modifier == 0):
		$"Race-Info/Panel/Modifiers_text/Constitution/Modifier".text = "0"
	else:
		$"Race-Info/Panel/Modifiers_text/Constitution/Modifier".text = str("+",constitution_modifier)
	if(intelligence_modifier == 0):
		$"Race-Info/Panel/Modifiers_text/Intelligence/Modifier".text = "0"
	else:
		$"Race-Info/Panel/Modifiers_text/Intelligence/Modifier".text = str("+",intelligence_modifier)
	if(wisdom_modifier == 0):
		$"Race-Info/Panel/Modifiers_text/Wisdom/Modifier".text = "0"
	else:
		$"Race-Info/Panel/Modifiers_text/Wisdom/Modifier".text = str("+",wisdom_modifier)
	if(charisma_modifier == 0):
		$"Race-Info/Panel/Modifiers_text/Charisma/Modifier".text = "0"
	else:
		$"Race-Info/Panel/Modifiers_text/Charisma/Modifier".text = str("+",charisma_modifier)
	pass
