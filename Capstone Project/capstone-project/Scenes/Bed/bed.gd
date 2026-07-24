extends Node2D

@export var obj_name: String

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_zone(obj_name)

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_left_zone(obj_name)
