extends CharacterBody2D

@onready var walk_forward: AnimatedSprite2D = $"Walk Forward"
@onready var walk_backward: AnimatedSprite2D = $"Walk Backward"
@onready var walk_left: AnimatedSprite2D = $"Walk Left"
@onready var walk_right: AnimatedSprite2D = $"Walk Right"

#sets move speed
const MOVE_SPEED: int = 200

var move_direction: Vector2 = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	walk_backward.hide()
	walk_left.hide()
	walk_right.hide()
	walk_forward.show()

#plays correct animation based on move_diretion
#and stops all other animations
func play_animation():
	#play walk_forward animation and stop all others
	if (move_direction.y > 0):
		#Stop and hide all other animations
		walk_backward.stop()
		walk_backward.hide()
		walk_left.stop()
		walk_left.hide()
		walk_right.stop()
		walk_right.hide()
		#Play and show correct animation
		walk_forward.show()
		walk_forward.play()
	#play walk_backward animation and stop all others
	if (move_direction.y < 0):
		#Stop and hide all other animations
		walk_forward.stop()
		walk_forward.hide()
		walk_left.stop()
		walk_left.hide()
		walk_right.stop()
		walk_right.hide()
		#Play and show correct animation
		walk_backward.show()
		walk_backward.play()
	#play walk_left animation and stop all others
	if (move_direction.x < 0 && move_direction.y == 0):
		#Stop and hide all other animations
		walk_backward.stop()
		walk_backward.hide()
		walk_forward.stop()
		walk_forward.hide()
		walk_right.stop()
		walk_right.hide()
		#Play and show correct animation
		walk_left.show()
		walk_left.play()
	#play walk_right animation and stop all others
	if (move_direction.x > 0 && move_direction.y == 0):
		#Stop and hide all other animations
		walk_backward.stop()
		walk_backward.hide()
		walk_left.stop()
		walk_left.hide()
		walk_forward.stop()
		walk_forward.hide()
		#Play and show correct animation
		walk_right.show()
		walk_right.play()

#stops all animation
func stop_animation():
	walk_backward.stop()
	walk_forward.stop()
	walk_left.stop()
	walk_right.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass

func _physics_process(delta: float) -> void:

	move_direction = Vector2.ZERO
	
	if Input.is_action_pressed("Up"):
		move_direction.y -= 1
	if Input.is_action_pressed("Down"):
		move_direction.y += 1
	if Input.is_action_pressed("Left"):
		move_direction.x -= 1
	if Input.is_action_pressed("Right"):
		move_direction.x += 1
		
	velocity = move_direction*MOVE_SPEED
	
	play_animation()

	if(move_direction == Vector2(0,0)):
		stop_animation()
		
	move_and_slide()
