extends Resource
class_name ASLQuiz


#Create a quiz of request size and difficulty level
static func create_quiz(size: int, difficulty: int) -> Array[ASLGenerator]:
	var quiz: Array[ASLGenerator]
	
	for i in range(size):
		quiz.append(ASLGenerator.new().generate_question(difficulty))
		
	return quiz

#Create an array of ASLSigns of requested size and difficulty
static func learn_signs(size: int, difficulty: int) -> Array[ASLGenerator]:
	var new_signs: Array[ASLGenerator]
	
	for i in range(size):
		new_signs.append(ASLGenerator.new().generate_correct_sign(difficulty))
		
	return new_signs
