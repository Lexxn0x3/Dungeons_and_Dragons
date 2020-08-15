extends VBoxContainer

func _process(delta):
	var i = 1
	var children = $".".get_children()
	var no_profs = true
	while i<$".".get_child_count():
		var current = children[i].get_children()
		if !current[1].get_children()[0].pressed:
			children[i].visible = false
		else:
			children[i].visible = true
			no_profs = false
		if no_profs:
			children[0].visible = true
		else:
			children[0].visible = false
		i = i + 1
		
	pass
