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

func set_tree_data():
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_home()
