extends Resource
class_name ASLLearning

static func generate_new_sign(database: Array[ASLSign]) -> ASLSign:
	#assigns new_sign with a randomly selected sign from database
	var new_sign: ASLSign = database.pick_random()
	
	#picks new sign if  the previously picked sign is already
	#unlocked.
	if (new_sign.is_unlocked == true):
		while (new_sign.is_unlocked == true):
			new_sign = database.pick_random()
			
	#sets new_sign is_unlocked to true
	new_sign.is_unlocked = true
	
	return new_sign
	
