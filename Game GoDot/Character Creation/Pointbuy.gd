extends Node2D



var strength = 10
var dexterity = 10
var constitution = 10
var intelligence = 10
var wisdom = 10
var charisma = 10
var points_left = 15


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_update_text()
	if(((points_left>0&&strength<14)||(points_left>1&&strength>13))&&(strength<15)):
		$"Strength/Strength UP".disabled = false
	else:
		$"Strength/Strength UP".disabled = true
	if(strength<9):
		$"Strength/Strength DOWN".disabled = true
	else:
		$"Strength/Strength DOWN".disabled = false
	
	if(((points_left>0&&dexterity<14)||(points_left>1&&dexterity>13))&&(dexterity<15)):
		$"Dexterity/Dexterity UP".disabled = false
	else:
		$"Dexterity/Dexterity UP".disabled = true
	if(dexterity<9):
		$"Dexterity/Dexterity DOWN".disabled = true
	else:
		$"Dexterity/Dexterity DOWN".disabled = false
	
	if(((points_left>0&&constitution<14)||(points_left>1&&constitution>13))&&(constitution<15)):
		$"Constitution/Constitution UP".disabled = false
	else:
		$"Constitution/Constitution UP".disabled = true
	if(constitution<9):
		$"Constitution/Constitution DOWN".disabled = true
	else:
		$"Constitution/Constitution DOWN".disabled = false
	
	if(((points_left>0&&intelligence<14)||(points_left>1&&intelligence>13))&&(intelligence<15)):
		$"Intelligence/Intelligence UP".disabled = false
	else:
		$"Intelligence/Intelligence UP".disabled = true
	if(intelligence<9):
		$"Intelligence/Intelligence DOWN".disabled = true
	else:
		$"Intelligence/Intelligence DOWN".disabled = false
	
	if(((points_left>0&&wisdom<14)||(points_left>1&&wisdom>13))&&(wisdom<15)):
		$"Wisdom/Wisdom UP".disabled = false
	else:
		$"Wisdom/Wisdom UP".disabled = true
	if(wisdom<9):
		$"Wisdom/Wisdom DOWN".disabled = true
	else:
		$"Wisdom/Wisdom DOWN".disabled = false
	
	if(((points_left>0&&charisma<14)||(points_left>1&&charisma>13))&&(charisma<15)):
		$"Charisma/Charisma UP".disabled = false
	else:
		$"Charisma/Charisma UP".disabled = true
	if(charisma<9):
		$"Charisma/Charisma DOWN".disabled = true
	else:
		$"Charisma/Charisma DOWN".disabled = false
	pass



func _update_text():
	$Strength.text = str(strength)
	$Dexterity.text = str(dexterity)
	$Constitution.text = str(constitution)
	$Intelligence.text = str(intelligence)
	$Wisdom.text = str(wisdom)
	$Charisma.text = str(charisma)
	$Points_left.text = str(points_left)
	pass



func _on_Strength_UP_pressed():
	if(strength<14):
		points_left = points_left - 1
		strength = strength + 1
	else:
		points_left = points_left - 2
		strength = strength + 1
	pass # Replace with function body.

func _on_Strength_DOWN_pressed():
	if(strength<15):
		points_left = points_left + 1
		strength = strength - 1
	else:
		points_left = points_left + 2
		strength = strength - 1
	pass # Replace with function body.



func _on_Dexterity_UP_pressed():
	if(dexterity<14):
		points_left = points_left - 1
		dexterity = dexterity + 1
	else:
		points_left = points_left - 2
		dexterity = dexterity + 1
	pass # Replace with function body.

func _on_Dexterity_DOWN_pressed():
	if(dexterity<15):
		points_left = points_left + 1
		dexterity = dexterity - 1
	else:
		points_left = points_left + 2
		dexterity = dexterity - 1
	pass # Replace with function body.



func _on_Constitution_UP_pressed():
	if(constitution<14):
		points_left = points_left - 1
		constitution = constitution + 1
	else:
		points_left = points_left - 2
		constitution = constitution + 1
	pass # Replace with function body.

func _on_Constitution_DOWN_pressed():
	if(constitution<15):
		points_left = points_left + 1
		constitution = constitution - 1
	else:
		points_left = points_left + 2
		constitution = constitution - 1
	pass # Replace with function body.



func _on_Intelligence_UP_pressed():
	if(intelligence<14):
		points_left = points_left - 1
		intelligence = intelligence + 1
	else:
		points_left = points_left - 2
		intelligence = intelligence + 1
	pass # Replace with function body.

func _on_Intelligence_DOWN_pressed():
	if(intelligence<15):
		points_left = points_left + 1
		intelligence = intelligence - 1
	else:
		points_left = points_left + 2
		intelligence = intelligence - 1
	pass # Replace with function body.



func _on_Wisdom_UP_pressed():
	if(wisdom<14):
		points_left = points_left - 1
		wisdom = wisdom + 1
	else:
		points_left = points_left - 2
		wisdom = wisdom + 1
	pass # Replace with function body.

func _on_Wisdom_DOWN_pressed():
	if(wisdom<15):
		points_left = points_left + 1
		wisdom = wisdom - 1
	else:
		points_left = points_left + 2
		wisdom = wisdom - 1
	pass # Replace with function body.



func _on_Charisma_UP_pressed():
	if(charisma<14):
		points_left = points_left - 1
		charisma = charisma + 1
	else:
		points_left = points_left - 2
		charisma = charisma + 1
	pass # Replace with function body.

func _on_Charisma_DOWN_pressed():
	if(charisma<15):
		points_left = points_left + 1
		charisma = charisma - 1
	else:
		points_left = points_left + 2
		charisma = charisma - 1
	pass # Replace with function body.
