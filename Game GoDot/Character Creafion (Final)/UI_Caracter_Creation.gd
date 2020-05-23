extends Control

#Level
var Level = 1
var XP = 0

#Character
var Name = str("")
var Race = str ("")

#Classes
var Current_Class_number = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Level/XP-Bar
	if XP > XP_next_level(Level):
		Level = Level + 1
		if Level>20:
			Level = 20
	update_XP_bar()
	
	#Basic_infos Update
	$"Background_Info/Basic_Infos/level_ges".text = str("Level ",Level)
	$"Background_Info/Basic_Infos/Name".text = str(Name)
	
	#Classes
	
	pass


func update_XP_bar():
	var XP_bar = $"Background_Info/XP"
	var XP_info = $"Background_Info/XP/Progress"
	
	if Level == 20:
		XP_bar.max_value = 10
		XP_bar.min_value = 0
		XP_bar.value = 10
		XP_info.text = str("XP = ",XP)
		
	else:
		XP_bar.value = XP
		XP_bar.max_value = XP_next_level(Level)
		XP_bar.min_value = XP_next_level(Level - 1)
		XP_info.text = str(XP," / ", XP_bar.max_value)

func XP_next_level(Level):
	if Level == 1:
		return 300
	elif Level == 2:
		return 900
	elif Level == 3:
		return 2700
	elif Level == 4:
		return 6500
	elif Level == 5:
		return 14000
	elif Level == 6:
		return 23000
	elif Level == 7:
		return 34000
	elif Level == 8:
		return 48000
	elif Level == 9:
		return 64000
	elif Level == 10:
		return 85000
	elif Level == 11:
		return 100000
	elif Level == 12:
		return 120000
	elif Level == 13:
		return 140000
	elif Level == 14:
		return 165000
	elif Level == 15:
		return 195000
	elif Level == 16:
		return 225000
	elif Level == 17:
		return 265000
	elif Level == 18:
		return 305000
	elif Level == 19:
		return 355000
	elif Level == 20:
		return 355000
	else:
		return 0

