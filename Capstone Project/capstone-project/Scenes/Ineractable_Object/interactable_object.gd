extends Area2D
class_name Interactable_Object

@onready var character: CharacterBody2D = $CharacterBody2D

#sets character's current interactable when character body enters the interaction zone to self.
func _on_interaction_zone_body_entered(body: Node2D) -> void:
	character.set_current_interactable(self)


#sets character's current interactable to null when character body leaves the interaction zone.
func _on_interaction_zone_body_exited(body: Node2D) -> void:
	character.set_current_interactable(null)
