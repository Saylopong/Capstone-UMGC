extends Node2D

@onready var tree_1: Area2D = $TREE1
@onready var tree_2: Area2D = $TREE2
@onready var tree_3: Area2D = $TREE3

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_home()

func set_tree1_data(tree1_Q:int, tree1_AC: int):
	tree_1.set_tree_data(tree1_Q,tree1_AC)

func set_tree2_data(tree2_Q:int, tree2_AC: int):
	tree_2.set_tree_data(tree2_Q,tree2_AC)
	
func set_tree3_data(tree3_Q:int, tree3_AC: int):
	tree_3.set_tree_data(tree3_Q,tree3_AC)
