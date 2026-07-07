extends Resource
class_name ASLQuestion
#This class generates ASL signs from the Array of ASLSigns imported into it.
#It uses these signs to generate different ASLSign Arrays and stores 4 of them
#inside of question.
var question: Array[ASLSign]
#Generates an array of ASL signs
#Correct answer sign is always index 0 in question_array
func generate_question(database: Array[ASLSign]):
	#Add correct answer to index 0
	question.append(generate_correct_sign(database))
	#Add random ASLSigns to index 1,2, and 3
	for i in range(3):
		question.append(generate_random(database,question.get(0)))


#Intended for private use
static func generate_correct_sign(database: Array[ASLSign]) -> ASLSign:
	
	var correct_sign: ASLSign = database.pick_random()
	
	while (correct_sign.is_unlocked == false):
		correct_sign = database.pick_random()
	
	return correct_sign
	
#Intended for private use
#Returns incorrect sign
func generate_random(database: Array[ASLSign], correct_sign: ASLSign) -> ASLSign:
	var incorrect_sign: ASLSign = database.pick_random()
	
	while (incorrect_sign.meaning == correct_sign.meaning):
		incorrect_sign = database.pick_random()

	return incorrect_sign
	
	
