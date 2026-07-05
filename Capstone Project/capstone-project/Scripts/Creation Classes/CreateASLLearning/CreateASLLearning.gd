extends Resource
class_name CreateASLLearning
const AMT_OF_SIGNS: int = 4

#Create a quiz of request size and difficulty level
static func createLearning(database: ASLDataBase) -> Array[ASLSign]:
	var learning: Array[ASLSign]
	
	for i in AMT_OF_SIGNS:
		learning.append(ASLLearning.generate_new_sign(database))

	return learning
