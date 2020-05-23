extends VBoxContainer

var Hide_stuff = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Hide_stuff:
		if  !$Club/Profficiency.pressed &&  !$Dagger/Profficiency.pressed &&  !$Greatclub/Profficiency.pressed &&  !$Handaxe/Profficiency.pressed &&  !$Handaxe/Profficiency.pressed &&  !$Javelin/Profficiency.pressed &&  !$Light_Hammer/Profficiency.pressed &&  !$Mace/Profficiency.pressed &&  !$Quaterstaff/Profficiency.pressed &&  !$Sickle/Profficiency.pressed &&  !$Spear/Profficiency.pressed:
			$"Simple meele".visible = false
			$Space.visible = false
		
		if  !$Club/Profficiency.pressed:
			$Club.visible = false
		if  !$Dagger/Profficiency.pressed:
			$Dagger.visible = false
		if  !$Greatclub/Profficiency.pressed:
			$Greatclub.visible = false
		if  !$Handaxe/Profficiency.pressed:
			$Handaxe.visible = false
		if  !$Javelin/Profficiency.pressed:
			$Javelin.visible = false
		if  !$Light_Hammer/Profficiency.pressed:
			$Light_Hammer.visible = false
		if  !$Mace/Profficiency.pressed:
			$Mace.visible = false
		if  !$Quaterstaff/Profficiency.pressed:
			$Quaterstaff.visible = false
		if  !$Sickle/Profficiency.pressed:
			$Sickle.visible = false
		if  !$Spear/Profficiency.pressed:
			$Spear.visible = false
		
		if  !$Crossbow_light/Profficiency.pressed &&  !$Dart/Profficiency.pressed &&  !$Shortbow/Profficiency.pressed &&  !$Sling/Profficiency.pressed:
			$"Simple ranged weapons".visible = false
			$Space2.visible = false
		
		if  !$Crossbow_light/Profficiency.pressed:
			$Crossbow_light.visible = false
		if  !$Dart/Profficiency.pressed:
			$Dart.visible = false
		if  !$Shortbow/Profficiency.pressed:
			$Shortbow.visible = false
		if  !$Sling/Profficiency.pressed:
			$Sling.visible = false
		
		if  !$Battleaxe/Profficiency.pressed &&  !$Flail/Profficiency.pressed &&  !$Glaive/Profficiency.pressed &&  !$Greataxe/Profficiency.pressed &&  !$Greatsword/Profficiency.pressed &&  !$Halberd/Profficiency.pressed &&  !$Lance/Profficiency.pressed &&  !$Longsword/Profficiency.pressed &&  !$Maul/Profficiency.pressed &&  !$Morningstar/Profficiency.pressed &&  !$Pike/Profficiency.pressed &&  !$Rapier/Profficiency.pressed &&  !$Scimitar/Profficiency.pressed &&  !$Shortsword/Profficiency.pressed &&  !$War_pick/Profficiency.pressed &&  !$Warhammer/Profficiency.pressed &&  !$Whip/Profficiency.pressed:
			$"Martial Melee".visible = false
			$Space3.visible = false
		
		if  !$Battleaxe/Profficiency.pressed:
			$Battleaxe.visible = false
		if  !$Flail/Profficiency.pressed:
			$Flail.visible = false
		if  !$Glaive/Profficiency.pressed:
			$Glaive.visible = false
		if  !$Greataxe/Profficiency.pressed:
			$Greataxe.visible = false
		if  !$Greatsword/Profficiency.pressed:
			$Greatsword.visible = false
		if  !$Halberd/Profficiency.pressed:
			$Halberd.visible = false
		if  !$Lance/Profficiency.pressed:
			$Lance.visible = false
		if  !$Longsword/Profficiency.pressed:
			$Longsword.visible = false
		if  !$Maul/Profficiency.pressed:
			$Maul.visible = false
		if  !$Morningstar/Profficiency.pressed:
			$Morningstar.visible = false
		if  !$Pike/Profficiency.pressed:
			$Pike.visible = false
		if  !$Rapier/Profficiency.pressed:
			$Rapier.visible = false
		if  !$Scimitar/Profficiency.pressed:
			$Scimitar.visible = false
		if  !$Shortsword/Profficiency.pressed:
			$Shortsword.visible = false
		if  !$War_pick/Profficiency.pressed:
			$War_pick.visible = false
		if  !$Warhammer/Profficiency.pressed:
			$Warhammer.visible = false
		if  !$Whip/Profficiency.pressed:
			$Whip.visible = false
		
		if  !$Blowgun/Profficiency.pressed &&  !$Crossbow_Hand/Profficiency.pressed &&  !$Crossbow_Heavy/Profficiency.pressed &&  !$Longbow/Profficiency.pressed &&  !$Net/Profficiency.pressed:
			$Space3.visible = false
			$"Martial Ranged".visible = false
		
		if  !$Blowgun/Profficiency.pressed:
			$Blowgun.visible = false
		if  !$Crossbow_Hand/Profficiency.pressed:
			$Crossbow_Hand.visible = false
		if  !$Crossbow_Heavy/Profficiency.pressed:
			$Crossbow_Heavy.visible = false
		if  !$Longbow/Profficiency.pressed:
			$Longbow.visible = false
		if  !$Net/Profficiency.pressed:
			$Net.visible = false
	pass


func _on_Hide_pressed():
	var i = 0
	while i<$".".get_child_count():
		$".".get_children()[i].visible = true
		i = i + 1
	
	
	Hide_stuff = not Hide_stuff
	pass # Replace with function body.
