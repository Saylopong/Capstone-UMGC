extends Node

#represents question/learning bank for each tree
var DB_1:ASLDataBase = preload("uid://drtj5oug2qd1u")
var DB_2:ASLDataBase = preload("uid://bca7q66w0hmaj")
var DB_3:ASLDataBase = preload("uid://05t2ycw2ur2m")


#Game_Data
var tree_1_total_questions: int = 0
var tree_1_total_correct: int = 0
var tree_1_interacted: bool = false
var tree_2_total_questions: int = 0 
var tree_2_total_correct: int = 0 
var tree_2_interacted: bool = false
var tree_3_total_questions: int = 0
var tree_3_total_correct: int = 0
var tree_3_interacted: bool = false
var newspaper_interacted: bool = false

func _ready() -> void:
	SignalHub.quiz_finished.connect(quiz_finished)
	
func quiz_finished(total_questions:int, total_correct:int,tree:int):
	if(tree == 1):
		tree_1_total_questions += total_questions
		tree_1_total_correct += total_correct
		tree_1_interacted = true
	if(tree == 2):
		tree_2_total_questions += total_questions
		tree_2_total_correct += total_correct
		tree_2_interacted = true
	if(tree == 3):
		tree_3_total_questions += total_questions
		tree_3_total_correct += total_correct
		tree_3_interacted = true

func reset_day():
	tree_1_interacted = false
	tree_2_interacted = false
	tree_3_interacted = false
	newspaper_interacted = false
