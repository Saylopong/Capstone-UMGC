extends Node

#Actual in scene instantiation of UI's
#we will use .show() and .hide() as needed
@onready var asl_learning_ui: ASL_Learning_UI = $ASL_Learning_UI
@onready var asl_quiz_ui: ASL_Quiz_UI = $ASL_Quiz_UI
@onready var pause_ui: Control = $Pause_UI

#stores what zones the character is currently in
var in_zone: Array[String]

#represents question/learning bank for each tree
@export var database1: ASLDataBase
@export var database2: ASLDataBase
@export var database3: ASLDataBase

func _ready() -> void:
	#connects functions to signals
	SignalHub.player_entered_zone.connect(player_entered_interactable_zone)
	SignalHub.player_left_zone.connect(player_left_interactable_zone)
	SignalHub.quiz_finished.connect(end_quiz)
	#SignalHub.home_to_farm.connect(farm_scene)
	#SignalHub.farm_to_home.connect(home_scene)
	#SignalHub.quit_game.connect(quit)


func _unhandled_input(event: InputEvent) -> void:
	#checks if player pressed "E"
	if event.is_action_pressed("Interact"):
		#checks if player has entered any objects interaction zone.
		if in_zone.size() != 0:
			Handle_Interact(in_zone.get(0))
	#calls function to pause game and display pause UI when escape is pressed
	if event.is_action_pressed("Pause"):
		pause_game()
	#TEST_ACTION is Shift+T
	if event.is_action_pressed("TEST_ACTION"):
		print("TEST_ACTION PRESSED")
		Handle_Interact("TREE1")

#performs correct action based on what object the player first entered the zone of.
#if the player is in multiple objects zones the others are ignored.
#since godot automatically resizes arrays in_zone.get(0) if in_zone.size() != 0 is
#always valid.
func Handle_Interact(Interactable: String):
	match Interactable:
		"TREE1":
			print("Quiz Started")
			asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(database1.get_all_questions()))
			asl_learning_ui.hide()
			asl_quiz_ui.show()
		"TREE2":
			asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(database2.get_all_questions()))
			asl_learning_ui.hide()
			asl_quiz_ui.show()
		"TREE3":
			asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(database3.get_all_questions()))
			asl_learning_ui.hide()
			asl_quiz_ui.show()
		"NEWSPAPER":
			print("Learning Started")
			asl_quiz_ui.hide()
			asl_learning_ui.show()
			show_new_signs()
		"BED":
			#Reset Day - to be implemented
			pass

func pause_game():
	#pauses game if game is not currently paused
	#shows pause_ui
	if(!get_tree().paused):
		get_tree().paused = true
		pause_ui.show()
	#unpauses game if game is currently paused
	#hides pause_ui
	if(get_tree().paused):
		get_tree().paused = false
		pause_ui.hide()


#Needs to Connect to transition signal to home
func home_scene():
	SceneTransitioner.home_transition()

#Needs to connect to transition signal to farm
func farm_scene():
	SceneTransitioner.farm_transition()

#updates asl_learning_ui with new ASL signs for the player to learn.
#should only show questions that the player has not unlocked at the current
#difficulty level.
func show_new_signs():
	if(database1.is_learned == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(database1.get_all_questions()))
		asl_learning_ui.show()
		database1.is_learned_test()
	if(database1.is_learned && database2.is_learned == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(database2.get_all_questions()))
		asl_learning_ui.show()
		database2.is_learned_test()
	if(database1.is_learned && database2.is_learned && database3.is_learned == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(database3.get_all_questions()))
		asl_learning_ui.show()
		database3.is_learned_test()
	if(database1.is_learned && database2.is_learned && database3.is_learned):
		#Could show text showing all currently implimented ASL signs have been learned
		pass

#Called when ASL_Quiz_UI emits quiz_finished signal and hides the quiz UI
func end_quiz(correclty_answered: int):
	asl_quiz_ui.hide()
	print("QUIZ FINISHED, correct:",correclty_answered)

func quit():
	#IF SAVE STATE IS IMPLIMENTED THIS NEEDS TO SAVE THE GAME STATE BEFORE QUITING.
	get_tree().quit()

#add object to in_zone
func player_entered_interactable_zone(object: String):
	in_zone.append(object)

#remove object from in_zone
func player_left_interactable_zone(object: String):
	in_zone.erase(object)
