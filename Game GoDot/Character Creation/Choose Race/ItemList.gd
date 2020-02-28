extends ItemList
var subclass_temp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var i = 0
	while(i>40):
		_on_ItemList2_item_selected(i)
	print(subclass_temp)
	pass


func _on_ItemList2_item_selected(index):
	subclass_temp = index
	index = 1
	pass # Replace with function body.
