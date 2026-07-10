extends Area2D

@export var obj_name: String = "BED"

#detects when player enters the Bed's interaction zone and notifies Game_Manager
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_zone(obj_name)

#detects when player leaves the Bed's interaction zone and notifies Game_Manager
func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_left_zone(obj_name)
