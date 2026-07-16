extends Resource
class_name CreateASLLearning
const AMT_OF_SIGNS: int = 4

#Create a learning
static func createLearning(database: Array[ASLSign]) -> Array[ASLSign]:
	var learning: Array[ASLSign]
	
	for i in AMT_OF_SIGNS:
		learning.append(ASLLearning.generate_new_sign(database))
	print("CreateASLLearning -> returning new learning")
	return learning
