extends Resource
class_name ASLQuiz

#Create a quiz of request size and difficulty level
static func create_quiz(size: int, difficulty: int) -> Array[ASLQuestion]:
	var quiz: Array[ASLQuestion]
	
	for i in range(size):
		quiz.append(ASLQuestion.new().generate_question(difficulty))
		
	return quiz
	
