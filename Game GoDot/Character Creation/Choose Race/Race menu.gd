extends Node2D


var strength_modifier = 0
var dexterity_modifier = 0
var constitution_modifier = 0
var intelligence_modifier = 0
var wisdom_modifier = 0
var charisma_modifier = 0
var subraces_initiated = false
var subrace

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var race = get_node("Race Menu/ItemList").racetemp
	subraces_initiated = $"Race Menu/ItemList".subraces_initiated_temp
	_update_modifiers()
	_reset_info_screen()
	subrace = _get_selected_item()
	
	if(race == 0):			#edit Infos Later
		$"Race-Info/Panel/Race_Name/Name".text = "Dragonborn"
		strength_modifier = 2
		charisma_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""	#	\n = Zeilenumbruch
		$"Race-Info/Panel/Infos/Info".text = ""
		$"Race-Info/Panel/Subraces".text = "Draconic Ancestry"
		if(!subraces_initiated):
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Black Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Blue Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Brass Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Bronze Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Copper Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Gold Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Green Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Red Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("Silver Dragon")
			$"Race-Info/Panel/Subraces/Subrace menu".add_item("White Dragon")
			subraces_initiated = true
		if(subrace == 0):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 1):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 2):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 3):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 4):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 5):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 6):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 7):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 8):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
		elif(subrace == 9):
			$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
	elif(race == 1):
		$"Race-Info/Panel/Race_Name/Name".text = "Dwarf"
		constitution_modifier = 2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 2):
		$"Race-Info/Panel/Race_Name/Name".text = "Elf"
		dexterity_modifier = 2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 3):
		$"Race-Info/Panel/Race_Name/Name".text = "Gnome"
		intelligence_modifier = 2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 4):
		$"Race-Info/Panel/Race_Name/Name".text = "Half-Elf"
		charisma_modifier = 2
		#+1 in 2 other abillitys
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 5):
		$"Race-Info/Panel/Race_Name/Name".text = "Halfling"
		dexterity_modifier = 2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 6):
		$"Race-Info/Panel/Race_Name/Name".text = "Half-Orc"
		strength_modifier = 2
		constitution_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 7):
		$"Race-Info/Panel/Race_Name/Name".text = "Human"
		strength_modifier = 1
		dexterity_modifier = 1
		constitution_modifier = 1
		intelligence_modifier = 1
		wisdom_modifier = 1
		charisma_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 8):
		$"Race-Info/Panel/Race_Name/Name".text = "Tiefling"
		charisma_modifier = 2
		intelligence_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 9):
		$"Race-Info/Panel/Race_Name/Name".text = "Aarakocra"
		dexterity_modifier = 2
		wisdom_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 10):
		$"Race-Info/Panel/Race_Name/Name".text = "Genasi"
		constitution_modifier = 2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 11):
		$"Race-Info/Panel/Race_Name/Name".text = "Goliath"
		strength_modifier = 2
		constitution_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 12):
		$"Race-Info/Panel/Race_Name/Name".text = "Asimar"
		charisma_modifier = 2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 13):
		$"Race-Info/Panel/Race_Name/Name".text = "Bugbear"
		strength_modifier = 2
		dexterity_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 14):
		$"Race-Info/Panel/Race_Name/Name".text = "Firbolg"
		wisdom_modifier = 2
		strength_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 15):
		$"Race-Info/Panel/Race_Name/Name".text = "Goblin"
		dexterity_modifier = 2
		constitution_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 16):
		$"Race-Info/Panel/Race_Name/Name".text = "Hobgoblin"
		constitution_modifier = 2
		intelligence_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 17):
		$"Race-Info/Panel/Race_Name/Name".text = "Kenku"
		dexterity_modifier = 2
		wisdom_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 18):
		$"Race-Info/Panel/Race_Name/Name".text = "Kobold"
		dexterity_modifier = 2
		strength_modifier = -2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 19):
		$"Race-Info/Panel/Race_Name/Name".text = "Lizardfolk"
		constitution_modifier = 2
		wisdom_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 20):
		$"Race-Info/Panel/Race_Name/Name".text = "Orc"
		strength_modifier = 2
		constitution_modifier = 1
		intelligence_modifier = -2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 21):
		$"Race-Info/Panel/Race_Name/Name".text = "Tabaxi"
		dexterity_modifier = 2
		charisma_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 22):
		$"Race-Info/Panel/Race_Name/Name".text = "Triton"
		strength_modifier = 1
		constitution_modifier = 1
		charisma_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 23):
		$"Race-Info/Panel/Race_Name/Name".text = "Yuan-ti Pureblood"
		charisma_modifier = 2
		intelligence_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 24):
		$"Race-Info/Panel/Race_Name/Name".text = "Feral Tiefling"
		dexterity_modifier = 2
		intelligence_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 25):
		$"Race-Info/Panel/Race_Name/Name".text = "Tortle"
		strength_modifier = 2
		wisdom_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 26):
		$"Race-Info/Panel/Race_Name/Name".text = "Changeling"
		charisma_modifier = 2
		#+1 in Abillity of choice
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 27):
		$"Race-Info/Panel/Race_Name/Name".text = "Kalashtar"
		wisdom_modifier = 2
		charisma_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 28):
		$"Race-Info/Panel/Race_Name/Name".text = "Orc of Eberron"
		strength_modifier = 2
		constitution_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 29):
		$"Race-Info/Panel/Race_Name/Name".text = "Shifter"
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 30):
		$"Race-Info/Panel/Race_Name/Name".text = "Warforged"
		constitution_modifier = 2
		#+1 in Abillity of choice
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 31):
		$"Race-Info/Panel/Race_Name/Name".text = "Gith"
		intelligence_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 32):
		$"Race-Info/Panel/Race_Name/Name".text = "Centaur"
		strength_modifier = 2
		wisdom_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 33):
		$"Race-Info/Panel/Race_Name/Name".text = "Loxodon"
		constitution_modifier = 2
		wisdom_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 34):
		$"Race-Info/Panel/Race_Name/Name".text = "Minotaur"
		strength_modifier = 2
		constitution_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = "" 
	elif(race == 35):
		$"Race-Info/Panel/Race_Name/Name".text = "Simic Hybrid"
		constitution_modifier = 2
		#+1 in Abillity of coice
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 36):
		$"Race-Info/Panel/Race_Name/Name".text = "Vedalken"
		intelligence_modifier = 2
		wisdom_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 37):
		$"Race-Info/Panel/Race_Name/Name".text = "Verdan"
		constitution_modifier = 1
		charisma_modifier = 2
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 38):
		$"Race-Info/Panel/Race_Name/Name".text = "Locathah"
		strength_modifier = 2
		dexterity_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	elif(race == 39):
		$"Race-Info/Panel/Race_Name/Name".text = "Grung"
		dexterity_modifier = 2
		constitution_modifier = 1
		$"Race-Info/Panel/Traits and Feats/Info".text = ""
		$"Race-Info/Panel/Infos/Info".text = ""
	pass


func _update_modifiers():
	if(strength_modifier < 1 ):
		$"Race-Info/Panel/Modifiers_text/Strength/Modifier".text = str(strength_modifier)
	else:
		$"Race-Info/Panel/Modifiers_text/Strength/Modifier".text = str("+",strength_modifier)
	if(dexterity_modifier < 1):
		$"Race-Info/Panel/Modifiers_text/Dexterity/Modifier".text = str(dexterity_modifier)
	else:
		$"Race-Info/Panel/Modifiers_text/Dexterity/Modifier".text = str("+",dexterity_modifier)
	if(constitution_modifier < 1):
		$"Race-Info/Panel/Modifiers_text/Constitution/Modifier".text = str(constitution_modifier)
	else:
		$"Race-Info/Panel/Modifiers_text/Constitution/Modifier".text = str("+",constitution_modifier)
	if(intelligence_modifier < 1):
		$"Race-Info/Panel/Modifiers_text/Intelligence/Modifier".text = str(intelligence_modifier)
	else:
		$"Race-Info/Panel/Modifiers_text/Intelligence/Modifier".text = str("+",intelligence_modifier)
	if(wisdom_modifier < 1):
		$"Race-Info/Panel/Modifiers_text/Wisdom/Modifier".text = str(wisdom_modifier)
	else:
		$"Race-Info/Panel/Modifiers_text/Wisdom/Modifier".text = str("+",wisdom_modifier)
	if(charisma_modifier < 1):
		$"Race-Info/Panel/Modifiers_text/Charisma/Modifier".text = str(charisma_modifier)
	else:
		$"Race-Info/Panel/Modifiers_text/Charisma/Modifier".text = str("+",charisma_modifier)
	pass
func _reset_info_screen():
	strength_modifier = 0
	dexterity_modifier = 0
	constitution_modifier = 0
	intelligence_modifier = 0
	wisdom_modifier = 0
	charisma_modifier = 0
	$"Race-Info/Panel/Traits and Feats/Info".text = ""
	$"Race-Info/Panel/Race_Name/Name".text = ""
	$"Race-Info/Panel/Infos/Info".text = ""
	$"Race-Info/Panel/Subraces".text = "Subraces"
	$"Race-Info/Panel/Subraces/RichTextLabel".text = ""
	if($"Race Menu/ItemList".rachechangedtemp):
		$"Race-Info/Panel/Subraces/Subrace menu".clear()
		$"Race Menu/ItemList".rachechangedtemp = false
	pass
func _get_selected_item():
	var i = 0
	while(i<$"Race-Info/Panel/Subraces/Subrace menu".get_item_count()):
		if($"Race-Info/Panel/Subraces/Subrace menu".is_selected(i)):
			return i
		i = i + 1
	pass
