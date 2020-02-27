extends ItemList


# Declare member variables here. Examples:
var racetemp

			
			# Link:		https://www.dndbeyond.com/races
			# 40 = not set
			# 0 = Dragonborn (PHB)
			# 1 = Dwarf (PHB)
			# 2 = Elf (PHB)
			# 3 = Gnome (PHB)
			# 4 = Half-Elf (PHB)
			# 5 = Halfling (PHB)
			# 6 = Half-Orc (PHB)
			# 7 = Human (PHB)
			# 8 = Tiefling (PHB)
			# 9 = Aarakocra (EEPC)
			# 10 = Genasi (EEPC)
			# 11 = Goliath (EEPC)
			# 12 = Aasimar (Need VGTM)
			# 13 = Bugbear (Need VGTM)
			# 14 = Firbolg (Need VGTM)
			# 15 = Goblin (Need VGTM)
			# 16 = Hobgoblin (Need VGTM)
			# 17 = Kenku (Need VGTM)
			# 18 = Kobold (Need VGTM)
			# 19 = Lizardfolk (Need VGTM)
			# 20 = Orc (Need VGTM)
			# 21 = Tabaxi (Need VGTM)
			# 22 = Triton (Need VGTM)
			# 23 = Yuan-ti Pureblood (Need VGTM)
			# 24 = Feral Tiefling (Need SCAG)
			# 25 = Tortle (Need TTP)
			# 26 = Changeling (Need ERFTLW)
			# 27 = Kalashtar (Need ERFTLW)
			# 28 = Orc of Eberron (Need ERFTLW)
			# 29 = Shifter (Need ERFTLW)
			# 30 = Warforged (Need ERFTLW)
			# 31 = Gith (Need MTOF)
			# 32 = Centaur (Need GGTR)(Fabi)
			# 33 = Loxodon (Need GGTR)(Fabi)
			# 34 = Minotaur (Need GGTR)(Fabi)
			# 35 = Simic Hybrid (Need GGTR)(Fabi)
			# 36 = Vedalken (Need GGTR)(Fabi)
			# 37 = Verdan (Need AI)
			# 38 = Locathah (Need LR)
			# 39 = Grung (Need OGA)
			

# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Dragonborn")
	add_item("Dwarf")
	add_item("Elf")
	add_item("Gnome")
	add_item("Half-Elf")
	add_item("Halfling")
	add_item("Half-Orc")
	add_item("Human")
	add_item("Tiefling")
	add_item("Aarakocra")
	add_item("Genasi")
	add_item("Goliath")
	add_item("Aasimar",null,false)
	add_item("Bugbear",null,false)
	add_item("Firbolg",null,false)
	add_item("Goblin",null,false)
	add_item("Hobgoblin",null,false)
	add_item("Kenku",null,false)
	add_item("Kobold",null,false)
	add_item("Lizardfolk",null,false)
	add_item("Orc",null,false)
	add_item("Tabaxi",null,false)
	add_item("Triton",null,false)
	add_item("Yuan-ti Pureblood",null,false)
	add_item("Feral Tiefling",null,false)
	add_item("Tortle",null,false)
	add_item("Changeling",null,false)
	add_item("Kalashtar",null,false)
	add_item("Orc of Eberron",null,false)
	add_item("Shifter",null,false)
	add_item("Warforged",null,false)
	add_item("Gith",null,false)
	add_item("Centaur",null,false)
	add_item("Loxodon",null,false)
	add_item("Minotaur",null,false)
	add_item("Simic Hybrid",null,false)
	add_item("Vedalken",null,false)
	add_item("Verdan",null,false)
	add_item("Locathah",null,false)
	add_item("Grung",null,false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var i = 0
	while(i>40):
		_on_ItemList_item_selected(i)
	pass


func _on_ItemList_item_selected(index):
	racetemp = index
	pass # Replace with function body.
