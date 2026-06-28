extends CharacterBody2D

const MOVE_SPEED: float = 100

var current_interactable: Interactable_Object = null

func _unhandled_input(event: InputEvent) -> void:
	#check for WASD inputs and adjust move flags to reflect character direction
	pass

func _physics_process(delta: float) -> void:
	#adjust player velocity to movespeed in the direct when pressed and uses set_vector
	pass

func get_movement() -> Vector2:
	#returns character movement vector multiplied by MOVE_SPEED
	return Vector2(0,0)
	
	
func interact() -> void:
	#Interact with object	
	pass

func set_current_interactable(interactable: Interactable_Object) -> void:
	#used to tell character what it is currently in the interaction zone of an Interactable_Obhect
	#Is passed null if player leaves an interaction zone of an Interactable_Object
	current_interactable = interactable
	
