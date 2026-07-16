extends Node2D



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is CharacterBody2D:
		SignalHub.emit_player_entered_home()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
