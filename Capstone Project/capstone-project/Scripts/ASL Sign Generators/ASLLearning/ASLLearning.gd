extends Resource
class_name ASLLearning

static func generate_new_sign(database:int) -> ASLSign:
	var new_sign: ASLSign
	#Picks new sign from DB_1
	if database == 1:
		#assigns new_sign with a randomly selected sign from database
		new_sign = DataManager.DB_1.all_qestions.pick_random()
		if (new_sign.is_unlocked == true):
			#picks new sign if  the previously picked sign is already
			#unlocked.
			while (new_sign.is_unlocked == true):
				new_sign = DataManager.DB_1.all_qestions.pick_random()
	#Picks new sign from DB_2
	if database == 2:
		#assigns new_sign with a randomly selected sign from database
		new_sign = DataManager.DB_2.all_qestions.pick_random()
		if (new_sign.is_unlocked == true):
			#picks new sign if  the previously picked sign is already
			#unlocked.
			while (new_sign.is_unlocked == true):
				new_sign = DataManager.DB_2.all_qestions.pick_random()
	#Picks new sign from DB_3
	if database == 3:
		#assigns new_sign with a randomly selected sign from database
		new_sign = DataManager.DB_3.all_qestions.pick_random()
		if (new_sign.is_unlocked == true):
			#picks new sign if  the previously picked sign is already
			#unlocked.
			while (new_sign.is_unlocked == true):
				new_sign = DataManager.DB_3.all_qestions.pick_random()
	
	#sets new_sign is_unlocked to true
	new_sign.is_unlocked = true
	
	print("DB_",database," ","\nnew sign: ",new_sign.meaning)
	return new_sign
	
