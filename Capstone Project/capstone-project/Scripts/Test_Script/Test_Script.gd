extends Node


func unlock_all_but_2(db: ASLDataBase):
	for i in range(db.all_qestions.size()):
		db.all_qestions.get(i).is_unlocked = true
		if i > (db.all_qestions.size() - 2):
			db.all_qestions.get(i).is_unlocked = false

func set_trees_starting_growth():
	ProgressManager.tree_1_total_correct = 0
	ProgressManager.tree_1_total_questions = 0
	ProgressManager.tree_2_total_correct = 0
	ProgressManager.tree_2_total_questions = 0
	ProgressManager.tree_3_total_correct = 0
	ProgressManager.tree_3_total_questions = 0

func set_trees_mid_growth():
	ProgressManager.tree_1_total_correct = 12
	ProgressManager.tree_1_total_questions = 12
	ProgressManager.tree_2_total_correct = 12
	ProgressManager.tree_2_total_questions = 12
	ProgressManager.tree_3_total_correct = 12
	ProgressManager.tree_3_total_questions = 12

func set_trees_full_grown():
	ProgressManager.tree_1_total_correct = 20
	ProgressManager.tree_1_total_questions = 20
	ProgressManager.tree_2_total_correct = 20
	ProgressManager.tree_2_total_questions = 20
	ProgressManager.tree_3_total_correct = 20
	ProgressManager.tree_3_total_questions = 20
