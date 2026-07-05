extends Resource
class_name ASLDataBase

#stores entire array of ASLQuestions
#this is where we are going to put our data base of ASL questions
@export var all_qestions: Array[ASLSign]
@export var difficulty_level: int

var is_learned: bool = false

#tests if the data base has all questions unlocked
func is_learned_test():
	for ASLSign in all_qestions:
		if(ASLSign.unlocked == false):
			break
	is_learned = true
