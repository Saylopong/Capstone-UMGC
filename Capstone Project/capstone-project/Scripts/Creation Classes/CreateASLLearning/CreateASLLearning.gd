extends Resource
class_name CreateASLLearning

#Create a learning
static func createLearning(database: int) -> Array[ASLSign]:
	var learning: Array[ASLSign]
	
	var amt_of_signs: int = get_amt_of_signs(database)
	for i in amt_of_signs:
		if database == 1:
			learning.append(ASLLearning.generate_new_sign(1))
		if database == 2:
			learning.append(ASLLearning.generate_new_sign(2))
		if database == 3:
			learning.append(ASLLearning.generate_new_sign(3))

	return learning
#returns how many signs are left to learn in the data base if less than 4
#returns 0 if given an invalid database
static func get_amt_of_signs(database:int) -> int:
	var signs_to_learn: int
	if database == 1:
		signs_to_learn = (DataManager.DB_1.all_questions.size() - DataManager.DB_1.signs_unlocked())
		if signs_to_learn < 4:
			return signs_to_learn
		else:
			return 4
	if database == 2:
		signs_to_learn = DataManager.DB_1.all_questions.size() - DataManager.DB_1.signs_unlocked()
		if signs_to_learn < 4:
			return signs_to_learn
		else:
			return 4
	if database == 3:
		signs_to_learn = DataManager.DB_1.all_questions.size() - DataManager.DB_1.signs_unlocked()
		if signs_to_learn < 4:
			return signs_to_learn
		else:
			return 4
	return 0
