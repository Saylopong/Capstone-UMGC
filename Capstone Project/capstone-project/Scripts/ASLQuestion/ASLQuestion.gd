extends Resource
class_name ASLQuestion

@export var database: ASLDataBase
var correct_sign: ASLSign
var question_array: Array[ASLSign]

#Generates an array of ASL signs
#Correct sign is always index 0 in question_array
func generate_question(difficulty: int) -> Array[ASLSign]:
	question_array.append(generate_correct_sign(difficulty))
#Need to generate a randomized ASL sign array
	return question_array

func generate_correct_sign(difficulty: int) -> ASLSign:
	#randomly selects an ASLSign from ASLDataBase
	correct_sign = database.pick_random()
	
	#ensure the question is of the correct difficulty level
	while ((correct_sign.difficulty_level != difficulty) || (correct_sign.is_unlocked == false)):
		#May not be optimal, this could be replaced by knowing the index
		#ranges of difficulty levels insdie of ASLDataBase
		correct_sign = database.pick_random()
	return correct_sign

#may not be neccessary
func get_correct_sign() -> ASLSign:
	return correct_sign
