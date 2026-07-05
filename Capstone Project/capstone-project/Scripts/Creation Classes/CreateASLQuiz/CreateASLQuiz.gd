extends Resource
class_name CreateASLQuiz

const AMT_OF_QUESTIONS: int = 4

#Create a quiz of request size and difficulty level
static func createQuiz(database: ASLDataBase) -> Array[ASLQuestion]:
	var quiz: Array[ASLQuestion]
	
	for i in AMT_OF_QUESTIONS:
		quiz.append(ASLQuestion.generate_question(database))
		
	return quiz
