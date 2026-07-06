extends Resource
class_name ASLQuestion

#This class generates ASL signs from the ASLDataBase imported into it.
#It uses these signs to generate different ASLSign Arrays for Create ASLQuiz

#Generates an array of ASL signs
#Correct answer sign is always index 0 in question_array
static func generate_question(database: ASLDataBase) -> Array[ASLSign]:
	var question_array : Array[ASLSign]
	#Add correct answer to index 0
	question_array.append(generate_correct_sign(database))
	#Add random ASLSigns to index 1,2, and 3
	for i in range(3):
		question_array.append(generate_random(database,question_array.get(0)))
	return question_array

#Intended for private use
static func generate_correct_sign(database: ASLDataBase) -> ASLSign:
	
	var correct_sign: ASLSign = database.pickrandom()
	
	while (correct_sign.is_unlocked == false):
		correct_sign = database.pick_random()
	
	return correct_sign
	
#Intended for private use
#Returns incorrect sign
static func generate_random(database: ASLDataBase, correct_sign: ASLSign) -> ASLSign:
	var incorrect_sign: ASLSign = database.pickrandom()
	
	while (incorrect_sign.meaning == correct_sign.meaning):
		incorrect_sign = database.pickrandom()

	return incorrect_sign
	
	
