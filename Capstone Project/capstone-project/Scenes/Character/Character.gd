extends CharacterBody2D



const MOVE_SPEED: int = 12500
var move_direction: Vector2 = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	#checks whether player is currently moving in the y direction
	#if the player is not changes move_direction Y vector to -1
	if event.is_action_pressed("Up") && velocity.y == 0:
		move_direction.y = -1
		print("UP")
	#checks whether player is currently moving in the -y direction
	#if so when the UP is released changes move_direction y vector to 0
	if event.is_action_released("Up") && velocity.y < 0:
		move_direction.y = 0
		print("UP_r")
	#checks whether player is currently moving in the y direction
	#if the player is not changes move_direction Y vector to 1
	if event.is_action_pressed("Down") && velocity.y == 0 : 
		move_direction.y = 1
		print("DOWN")
	#checks whether player is currently moving in the +y direction
	#if so when the Down is released changes move_direction Y vector to 0
	if event.is_action_released("Down") && velocity.y > 0: 
		move_direction.y = 0
		print("DOWN_r")
	#checks whether player is currently moving in the x direction
	#if the player is not changes move_direction X vector to -1
	if event.is_action_pressed("Left") && velocity.x == 0:
		move_direction.x = -1
		print("LEFT")
	#checks whether player is currently moving in the -x direction
	#if so when the Left is released changes move_direction X vector to 0
	if event.is_action_released("Left") && velocity.x < 0:
		move_direction.x = 0
		print("LEFT_r")
	#checks whether player is currently moving in the X direction
	#if the player is not changes move_direction X vector to 1
	if event.is_action_pressed("Right") && velocity.x == 0:
		move_direction.x = 1
		print("RIGHT")
	#checks whether player is currently moving in the +x direction
	#if so when the Right is released changes move_direction X vector to 0
	if event.is_action_released("Right") && velocity.x > 0:
		move_direction.x = 0
		print("RIGHT_r")


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass

func _physics_process(delta: float) -> void:
		velocity = delta*move_direction*MOVE_SPEED
		move_and_slide()
