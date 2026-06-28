extends Resource
class_name ASLGenerator

#This class generates ASL signs from the ASLDataBase imported into it.
#It uses these signs to generate different ASLSign Arrays for ASLQuiz

@export var database: ASLDataBase

var question_array: Array[ASLSign]
var learning_array: Array[ASLSign]

#Generates an array of ASL signs
#Correct sign is always index 0 in question_array
func generate_question(difficulty: int) -> Array[ASLSign]:
	question_array.append(generate_correct_sign(difficulty))
#Need to generate a randomized ASL sign array
	return question_array

func generate_correct_sign(difficulty: int) -> ASLSign:
	var correct_sign: ASLSign
	#randomly selects an ASLSign from ASLDataBase
	correct_sign = database.pick_random()
	
	#ensure the question is of the correct difficulty level
	while ((correct_sign.difficulty_level != difficulty) || (correct_sign.is_unlocked == false)):
		#May not be optimal, this could be replaced by knowing the index
		#ranges of difficulty levels insdie of ASLDataBase
		correct_sign = database.pick_random()
	return correct_sign

#Returns incorrect sign
func generate_random(difficulty: int) -> ASLSign:
	var incorrect_sign: ASLSign
	#Need to return incorrect_sign that is not the same as correct_sign
	return incorrect_sign
	
	
