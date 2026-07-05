extends Resource
class_name ASLLearning

static func generate_new_sign(database: ASLDataBase) -> ASLSign:
	
	var new_sign: ASLSign = database.pickrandom()
	
	while (new_sign.is_unlocked == true):
		#May not be optimal, this could be replaced by knowing the index
		#ranges of difficulty levels insdie of ASLDataBase
		new_sign = database.pick_random()
	
	return new_sign
	
