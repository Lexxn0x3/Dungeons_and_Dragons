extends Node
var mapScene
var map
var playerScene = load("res://Player/Player.tscn")
var player = playerScene.instance()

signal switchMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	pass

func _input(ev):
	if Input.is_action_pressed("ui_cancel"):
		emit_signal("switchMenu")
		print("switch")

func _on_MainMenu_hitPlay():
	var item = $MainMenu.get_selected_map()
	if item != PoolIntArray():
		if item == PoolIntArray([0]):
			mapScene = load("res://Maps/The Dark Pit of Gothmog of Udun/The Dark Pit of Gothmog of Udun.tscn")
		if item == PoolIntArray([1]):
			mapScene = load("res://Maps/The Warrens of Tenebrous/The Warrens of Tenebrous.tscn")
		map = mapScene.instance()
		add_child(map)
		add_child(player)
