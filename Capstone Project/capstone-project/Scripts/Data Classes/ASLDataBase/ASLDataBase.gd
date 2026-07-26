extends Resource
class_name ASLDataBase

#stores entire array of ASLQuestions
#this is where we are going to put our data base of ASL questions
@export var all_questions: Array[ASLSign]


var is_learned: bool = false


func signs_unlocked() -> int:
	var total_unlocked:int = 0
	for x:ASLSign in all_questions:
		if x.is_unlocked == true:
			total_unlocked += 1
	return total_unlocked
			
#tests if the data base has all questions unlocked
func is_learned_test():
	if signs_unlocked() == all_questions.size():
		is_learned = true



	#is_learned = true
	#for ASLSign in all_qestions:
		#if(ASLSign.is_unlocked == false):
			#is_learned = false
			#break
