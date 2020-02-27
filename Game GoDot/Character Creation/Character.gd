extends Node

# Choose Race => Choose Class => Determine Ability Scores => Describe Character => (Choose Equipment) => Ready

func _process(delta):
	
	var Race = 0 # 1-40

	var Character_class = 0 # 0-14
			
			#Link:		https://www.dndbeyond.com/classes
			# 0 = not set
			# 1 = Barbarian
			# 2 = Bard
			# 3 = Cleric
			# 4 = Druid
			# 5 = Fighter
			# 6 = Monk
			# 7 = Paladin
			# 8 = Ranger
			# 9 = Rogue
			# 10 = Sorcerer
			# 11 = Warlock
			# 12 = Wizard
			# 13 = Artificer
			# 14 = Blood Hunter
	
		
	var XP = 0			#von außen beeinflust
	
	if(Input.isaaction_("walk_slow")):
		XP = XP + 100
		
		
	
	var level			#level festlegen
	if(XP<300):
		level = 1
	elif(XP<900):
		level = 2
	elif(XP<2700):
		level =  3
	elif(XP<6500):
		level = 4
	elif(XP<14000):
		level = 5
	elif(XP<23000):
		level = 6
	elif(XP<34000):
		level = 7
	elif(XP<48000):
		level = 8
	elif(XP<64000):
		level = 9
	elif(XP<85000):
		level = 10
	elif(XP<100000):
		level = 11
	elif(XP<120000):
		level = 12
	elif(XP<140000):
		level = 13
	elif(XP<165000):
		level = 14
	elif(XP<195000):
		level = 15
	elif(XP<225000):
		level = 16
	elif(XP<265000):
		level = 17
	elif(XP<305000):
		level = 18
	elif(XP<355000):
		level = 19
	else:
		level = 20
	
	
	var Proficiency_bonus		# Proficiencie_Bonus festlegen
	if(level<5):
		Proficiency_bonus = 2
	elif(level<9):
		Proficiency_bonus = 3
	elif(level<13):
		Proficiency_bonus = 4
	elif(level<17):
		Proficiency_bonus = 5
	else:
		Proficiency_bonus = 6
	
				# 0XP = LVL 1 = +2 Proficiency
				# 300XP = LVL 2 = +2 Proficiency
				# 900XP = LVL 3 = +2 Proficiency
				# 2700XP = LVL 4 = +2 Proficiency
				# 6500XP = LVL 5 = +3 Proficiency
				# 14000XP = LVL 6 = +3 Proficiency
				# 23000XP = LVL 7 = +3 Proficiency
				# 34000XP = LVL 8 = +3 Proficiency
				# 48000XP = LVL 9 = +4 Proficiency
				# 64000XP = LVL 10 = +4 Proficiency
				# 85000XP = LVL 11 = +4 Proficiency
				# 100000XP = LVL 12 = +4 Proficiency
				# 120000XP = LVL 13 = +5 Proficiency
				# 140000XP = LVL 14 = +5 Proficiency
				# 165000XP = LVL 15 = +5 Proficiency
				# 195000XP = LVL 16 = +5 Proficiency
				# 225000XP = LVL 17 = +6 Proficiency
				# 265000XP = LVL 18 = +6 Proficiency
				# 305000XP = LVL 19 = +6 Proficiency
				# 355000XP = LVL 20 = +6 Proficiency
				
	#Modifier
		# 8 - 9 = -1
		# 10 - 11 = 0
		# 12 - 13 = 1
		# 14 - 15 = 2
		# 16 - 17 = 3
		# 18 - 19 = 4
		# 20 = 5
	
	_get_stats()




func _get_stats():
	var strength = get_node("Pointbuy.gd").strength
	var dexterity = get_node("Pointbuy.gd").dexterity
	var constitution = get_node("Pointbuy.gd").constitution
	var intelligence = get_node("Pointbuy.gd").intelligence
	var wisdom = get_node("Pointbuy.gd").wisdom
	var charisma = get_node("Pointbuy.gd").charisma
	pass
