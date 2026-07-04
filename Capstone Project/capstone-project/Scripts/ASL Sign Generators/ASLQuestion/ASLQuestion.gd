extends Resource
class_name ASLQuestion

#This class generates ASL signs from the ASLDataBase imported into it.
#It uses these signs to generate different ASLSign Arrays for ASLQuiz

#Generates an array of ASL signs
#Correct sign is always index 0 in question_array
static func generate_question(database: ASLDataBase) -> Array[ASLSign]:
	var question_array = Array[ASLSign]
	
	question_array.append(generate_correct_sign(database))
	#Need to generate a randomized ASL sign array
	return question_array

#Intended for private use
static func generate_correct_sign(database: ASLDataBase) -> ASLSign:
	
	var correct_sign: ASLSign = database.pickrandom()
	
	while (correct_sign.is_unlocked == false):
		#May not be optimal, this could be replaced by knowing the index
		#ranges of difficulty levels insdie of ASLDataBase
		correct_sign = database.pick_random()
	
	return correct_sign
	
#Intended for private use
#Returns incorrect sign
static func generate_random(database: ASLDataBase, correct_sign: ASLSign) -> ASLSign:
	var incorrect_sign: ASLSign = database.pickrandom()
	
	while (incorrect_sign.meaning == correct_sign.meaning):
		incorrect_sign = database.pickrandom()

	return incorrect_sign
	
	
