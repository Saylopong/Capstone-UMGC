extends Node

#used to unlock every sign but 1 in the data base
#keeps the last 1 unlocked.
func unlock_all_but_1(db: ASLDataBase):

	for i in range(db.all_questions.size()):
		db.all_questions.get(i).is_unlocked = true
		if i > (db.all_questions.size() - 2):
			db.all_questions.get(i).is_unlocked = false

#used to unlock every sign but 1 in the data base
#keeps the last 2 unlocked.
func unlock_all_but_2(db: ASLDataBase):

	for i in range(db.all_questions.size()):
		db.all_questions.get(i).is_unlocked = true
		if i > (db.all_questions.size() - 3):
			db.all_questions.get(i).is_unlocked = false

#used to unlock every sign but 1 in the data base
#keeps the last 3 unlocked.
func unlock_all_but_3(db: ASLDataBase):
	for i in range(db.all_questions.size()):
		db.all_questions.get(i).is_unlocked = true
		if i > (db.all_questions.size() - 4):
			db.all_questions.get(i).is_unlocked = false

#used to unlock every sign in the data base
func unlock_all(db: int):
	match db:
		1:
			for i:ASLSign in DataManager.DB_1.all_questions:
				i.is_unlocked = true
		2:
			for i:ASLSign in DataManager.DB_2.all_questions:
				i.is_unlocked = true
		3:
			for i:ASLSign in DataManager.DB_3.all_questions:
				i.is_unlocked = true


#sets all signs for tree 1 to unlocked
#sets tree growth for tree 1 to max
func test_tree2():
	DataManager.tree_1_total_correct = 20
	DataManager.tree_1_total_questions = 20
	unlock_all(1)

#sets all signs for tree 1 and 2 to unlocked
#sets tree growth for tree 1 and 2 to max
func test_tree3():
	DataManager.tree_1_total_correct = 20
	DataManager.tree_1_total_questions = 20
	unlock_all(1)
	DataManager.tree_2_total_correct = 20
	DataManager.tree_2_total_questions = 20
	unlock_all(2)

#sets trees to starting growth
func set_trees_starting_growth():
	DataManager.tree_1_total_correct = 0
	DataManager.tree_1_total_questions = 0
	DataManager.tree_2_total_correct = 0
	DataManager.tree_2_total_questions = 0
	DataManager.tree_3_total_correct = 0
	DataManager.tree_3_total_questions = 0

#sets trees to level 2 growth
func set_trees_mid_growth():
	DataManager.tree_1_total_correct = 12
	DataManager.tree_1_total_questions = 12
	DataManager.tree_2_total_correct = 12
	DataManager.tree_2_total_questions = 12
	DataManager.tree_3_total_correct = 12
	DataManager.tree_3_total_questions = 12

#sets trees to level 3 growth
func set_trees_full_grown():
	DataManager.tree_1_total_correct = 20
	DataManager.tree_1_total_questions = 20
	DataManager.tree_2_total_correct = 20
	DataManager.tree_2_total_questions = 20
	DataManager.tree_3_total_correct = 20
	DataManager.tree_3_total_questions = 20

#prints sign meaning and whether the sign is unlocked
#for every ASLSign in the data base given to it.
func print_signs(db: ASLDataBase):
	print("__PRINTING SIGNS__")
	for i  in range(db.all_questions.size()):
		print("Meaning: ", db.all_questions.get(i).meaning,"\nisUnlocked? ", db.all_questions.get(i).is_unlocked)
		print("-------------")

#prints whether the all DB are fully learned
func print_db_status():
	DataManager.DB_1.is_learned_test()
	print("DB_1 learned?: ",DataManager.DB_1.is_learned)
	DataManager.DB_2.is_learned_test()
	print("DB_2 learned?: ",DataManager.DB_2.is_learned)
	DataManager.DB_3.is_learned_test()
	print("DB_3 learned?: ",DataManager.DB_3.is_learned)
