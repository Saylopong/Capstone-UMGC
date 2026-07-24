extends Node

var tree_1_total_questions: int =0
var tree_1_total_correct: int = 0
var tree_1_interacted: bool = false
var tree_2_total_questions: int = 0 
var tree_2_total_correct: int = 0 
var tree_2_interacted: bool = false
var tree_3_total_questions: int = 20
var tree_3_interacted: bool = false
var tree_3_total_correct: int = 20 

func quiz_finished(total_questions:int, total_correct:int,tree:int):
	if(tree == 1):
		tree_1_total_questions += total_questions
		tree_1_total_correct += total_correct
	if(tree == 2):
		tree_2_total_questions += total_questions
		tree_2_total_correct += total_correct
	if(tree == 3):
		tree_3_total_questions += total_questions
		tree_3_total_correct += total_correct
