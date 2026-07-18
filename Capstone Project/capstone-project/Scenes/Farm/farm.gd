extends Node2D

@onready var tree_1: Area2D = $TREE1
@onready var tree_2: Area2D = $TREE2
@onready var tree_3: Area2D = $TREE3

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_home()
