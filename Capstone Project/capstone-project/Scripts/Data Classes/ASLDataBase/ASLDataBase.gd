extends Resource
class_name ASLDataBase

#stores entire array of ASLQuestions
#this is where we are going to put our data base of ASL questions
@export var all_qestions: Array[ASLSign]


var is_learned: bool = false

#tests if the data base has all questions unlocked
func is_learned_test():
	is_learned = true
	for ASLSign in all_qestions:
		if(ASLSign.is_unlocked == false):
			is_learned = false
			break
