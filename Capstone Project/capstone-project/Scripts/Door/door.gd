extends Area2D

#"FARM" or "HOME" - which scene this door leads to
@export var destination: String

#emits door_entered so Scene_Transitioner can change to the correct scene
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_door_entered(destination)
