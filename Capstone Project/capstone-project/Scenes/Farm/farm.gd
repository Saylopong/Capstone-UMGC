extends Node2D

class_name farm

const TREE = preload("uid://sjnrnc7cs4gp")

@onready var tree_1: ASLtree = TREE.instantiate()
@onready var tree_2: ASLtree = TREE.instantiate()
@onready var tree_3: ASLtree = TREE.instantiate()
@onready var t_1: Marker2D = $T1
@onready var t_2: Marker2D = $T2
@onready var t_3: Marker2D = $T3
@onready var tree_tutorial: DialogueBox = $Tree_Tutorial
@onready var to_home_tutorial: DialogueBox = $To_Home_Tutorial

func _ready() -> void:
	SignalHub.tutorial_completed.connect(show_tutorials)
	tree_1.position.x = t_1.position.x
	tree_1.position.y = t_1.position.y
	tree_1.obj_name = "TREE1"
	tree_2.position.x = t_2.position.x
	tree_2.position.y = t_2.position.y
	tree_2.obj_name = "TREE2"
	tree_3.position.x = t_3.position.x
	tree_3.position.y = t_3.position.y
	tree_3.obj_name = "TREE3"
	add_child(tree_1)
	add_child(tree_2)
	add_child(tree_3)
	set_tree_data()
	hide_tutorials()
	show_tutorials(4)


func set_tree_data():
	tree_1.answered_correctly = DataManager.tree_1_total_correct
	tree_1.total_questions = DataManager.tree_1_total_questions
	tree_1.grow()
	tree_2.answered_correctly = DataManager.tree_2_total_correct
	tree_2.total_questions = DataManager.tree_2_total_questions
	tree_2.grow()
	tree_3.answered_correctly = DataManager.tree_3_total_correct
	tree_3.total_questions = DataManager.tree_3_total_questions
	tree_3.grow()
	print(tree_1.total_questions)
	print(tree_1.answered_correctly)
	print(tree_2.total_questions)
	print(tree_2.answered_correctly)
	print(tree_3.total_questions)
	print(tree_3.answered_correctly)

func show_tutorials(step: int):
	if(!DataManager.tree_tutorial_shown && !DataManager.to_farm_tutorial_shown && step == 4):
		tree_tutorial.show()
		DataManager.tree_tutorial_shown = true
		tree_tutorial.set_text("T_TREE")
	if(DataManager.tree_tutorial_shown && step == 5):
		tree_tutorial.hide()
	if(DataManager.tree_tutorial_shown && !DataManager.to_home_tutorial_shown && step == 6):
		tree_tutorial.hide()
		to_home_tutorial.show()
		DataManager.to_home_tutorial_shown = true
		to_home_tutorial.set_text("T_TO_HOME")

func hide_tutorials():
	tree_tutorial.hide()
	to_home_tutorial.hide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_home()
