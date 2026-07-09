extends Area2D

@export var obj_name: String

@onready var level_1: Sprite2D = $"Level 1"
@onready var level_2: Sprite2D = $"Level 2"
@onready var level_3: Sprite2D = $"Level 3"

var interacted_today: bool = false
var growth_stage: int = 1
var number_correct: int = 0
var number_of_questions: int  = 0

#how many questions need to be done in order for growth stage 1 to be possible
const GROWTH_ELIGIBLE1: int = 10
#how many questions need to be done in order for growth stage 2 to be possible
const GROWTH_ELIGIBLE2: int = 20

func _ready() -> void:
	level_1.hide()
	level_2.hide()
	level_3.hide()
	show_growth()
	SignalHub.quiz_finished.connect(quiz_finished)

#Is called when ASL_Quiz_UI emits quiz_finished signal
func quiz_finished(correct: int):
	number_correct += correct
	#This needs to change if quizzes will be more than 4 questions long
	number_of_questions += 4
	check_progress()

func check_progress():
	#Tries to grow the tree if the player has answered atleast 75% of the total
	#questions correctly.
	if ((number_correct / number_of_questions) >= .75):
		grow()
	#Regresses the tree if growth stage is great than 1 and player has answered
	#less than 75% of the questions correctly
	else:
		if growth_stage > 1:
			regress()

func grow():
	if growth_stage == 1 && number_of_questions >= GROWTH_ELIGIBLE1:
		growth_stage += 1
	if growth_stage == 2 && number_of_questions >= GROWTH_ELIGIBLE2:
		growth_stage += 1
	show_growth()

func regress():
	growth_stage -= 1
	show_growth()

func show_growth():
	if(growth_stage == 1):
		level_2.hide()
		level_3.hide()
		level_1.show()
	if(growth_stage == 2):
		level_1.hide()
		level_3.hide()
		level_2.show()
	if(growth_stage == 3):
		level_2.hide()
		level_1.hide()
		level_3.show()

#detects when player enters Interact_Zone and emits that it has been entered
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_zone(obj_name)


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_zone(obj_name)
