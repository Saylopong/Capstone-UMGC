extends Node2D

class_name farm

const TREE = preload("uid://sjnrnc7cs4gp")

@onready var tree_1: ASLtree = TREE.instantiate()
@onready var tree_2: ASLtree = TREE.instantiate()
@onready var tree_3: ASLtree = TREE.instantiate()
@onready var t_1: Marker2D = $T1
@onready var t_2: Marker2D = $T2
@onready var t_3: Marker2D = $T3

func _ready() -> void:
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

func set_tree_data():
	tree_1.answered_correctly = ProgressManager.tree_1_total_correct
	tree_1.total_questions = ProgressManager.tree_1_total_questions
	tree_1.grow()
	tree_2.answered_correctly = ProgressManager.tree_2_total_correct
	tree_2.total_questions = ProgressManager.tree_2_total_questions
	tree_2.grow()
	tree_3.answered_correctly = ProgressManager.tree_3_total_correct
	tree_3.total_questions = ProgressManager.tree_3_total_questions
	tree_3.grow()
	print(tree_1.total_questions)
	print(tree_1.answered_correctly)
	print(tree_2.total_questions)
	print(tree_2.answered_correctly)
	print(tree_3.total_questions)
	print(tree_3.answered_correctly)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_home()
