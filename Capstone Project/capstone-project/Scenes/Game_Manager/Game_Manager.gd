extends Node

#Actual in scene instantiation of UI's
#we will use .show() and .hide() as needed
@onready var asl_learning_ui: ASL_Learning_UI = $ASL_Learning_UI
@onready var asl_quiz_ui: ASL_Quiz_UI = $ASL_Quiz_UI
@onready var pause_ui: Control = $Pause_UI
@onready var scene_container: MarginContainer = $Scene_Container

#We will need to adjust the preload for the final version
#of each scene
const FARM: PackedScene = preload("uid://cs667hsowc61p")
const HOME: PackedScene = preload("uid://bw02fladr3bc1")

const QUESTIONS_IN_QUIZ: int = 4

#represents question/learning bank for each tree
@export var database1: ASLDataBase
@export var database2: ASLDataBase
@export var database3: ASLDataBase

#stores what zones the character is currently in
var in_zone: Array[String]

var tree_data: Array[int] = [
	0,#Tree1 total questions
	0,#Tree1 total questions answered correctly
	0,#Tree2 total questions
	0,#Tree2 total questions answered correctly
	0,#Tree3 total questions
	0,#Tree3 total questions answered correctly
]

var tree1_total_questions: int = 0
var tree2_total_questions: int = 0
var tree3_total_questions: int = 0
var tree1_correct: int = 0
var tree2_correct: int = 0
var tree3_correct: int = 0

var last_quiz_tree: String

var game_paused: bool = false

func _ready() -> void:
	#connects functions to signals
	SignalHub.player_entered_zone.connect(player_entered_interactable_zone)
	SignalHub.player_left_zone.connect(player_left_interactable_zone)
	SignalHub.quiz_finished.connect(end_quiz)
	SignalHub.quit_game.connect(quit_game)
	SignalHub.player_entered_home.connect(load_home)
	SignalHub.player_left_home.connect(load_farm)
	SignalHub.learning_finished.connect(end_learning)
	SignalHub.pause_game.connect(pause_game)
	SignalHub.unpause_game.connect(unpause_game)
	load_farm()
	
	

#Checks to see if there is already a child in scene_container
#removes that child from the scene if there is 1
#Instantiates a new farm scene and adds it to scene container
func load_farm():
	if(scene_container.get_child_count() == 1):
		scene_container.get_child(0).queue_free()
	var farm = FARM.instantiate()
	scene_container.add_child(farm)
	set_tree_data()

#Checks to see if there is already a child in scene_container
#removes that child from the scene if there is 1
#Instantiates a new home scene and adds it to scene container
func load_home():
	if(scene_container.get_child_count() == 1):
		scene_container.get_child(0).queue_free()
	var home = HOME.instantiate()
	scene_container.add_child(home)


func _unhandled_input(event: InputEvent) -> void:
	#checks if player pressed "E"
	if event.is_action_pressed("Interact"):
		#checks if player has entered any objects interaction zone.
		if in_zone.size() != 0:
			Handle_Interact(in_zone.get(0))
	#TEST_ACTION is Shift+T
	elif event.is_action_pressed("TEST_ACTION"):
		print("TEST_ACTION PRESSED")
		#Handle_Interact("TREE1")
		#load_home()
	else:
		pass
			

#performs correct action based on what object the player first entered the zone of.
#if the player is in multiple objects zones the others are ignored.
#since godot automatically resizes arrays in_zone.get(0) if in_zone.size() != 0 is
#always valid.
func Handle_Interact(Interactable: String):
	match Interactable:
		"TREE1":
			#Changes how asl_quiz_ui interacts when the tree is paused.
			asl_quiz_ui.process_mode = Node.PROCESS_MODE_ALWAYS
			get_tree().paused = true
			asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(database1.get_all_questions()))
			asl_learning_ui.hide()
			asl_quiz_ui.show()
			tree1_total_questions += QUESTIONS_IN_QUIZ
			last_quiz_tree = "TREE1"
		"TREE2":
			#Changes how asl_quiz_ui interacts when the tree is paused.
			asl_quiz_ui.process_mode = Node.PROCESS_MODE_ALWAYS
			get_tree().paused = true
			
			asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(database2.get_all_questions()))
			asl_learning_ui.hide()
			asl_quiz_ui.show()
			tree2_total_questions += QUESTIONS_IN_QUIZ
			last_quiz_tree = "TREE2"
		"TREE3":
			#Changes how asl_quiz_ui interacts when the tree is paused.
			asl_quiz_ui.process_mode = Node.PROCESS_MODE_ALWAYS
			get_tree().paused = true
			
			asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(database3.get_all_questions()))
			asl_learning_ui.hide()
			asl_quiz_ui.show()
			tree3_total_questions += QUESTIONS_IN_QUIZ
			last_quiz_tree = "TREE3"
		"NEWSPAPER":
			asl_quiz_ui.hide()
			asl_learning_ui.show()
			show_new_signs()
		"BED":
			#Reset Day
			pass

#updates asl_learning_ui with new ASL signs for the player to learn.
#should only show questions that the player has not unlocked at the current
#difficulty level.
func show_new_signs():
	var show_one_ui = false
	asl_learning_ui.process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
	if(database1.is_learned == false && show_one_ui == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(database1.get_all_questions()))
		asl_learning_ui.show()
		database1.is_learned_test()
		show_one_ui = true
	if(database1.is_learned && database2.is_learned == false && show_one_ui == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(database2.get_all_questions()))
		asl_learning_ui.show()
		database2.is_learned_test()
		show_one_ui = true
	if(database1.is_learned && database2.is_learned && database3.is_learned == false && show_one_ui == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(database3.get_all_questions()))
		asl_learning_ui.show()
		database3.is_learned_test()
		show_one_ui = true
	if(database1.is_learned && database2.is_learned && database3.is_learned):
		#Could show text showing all currently implimented ASL signs have been learned
		pass

func end_quiz(correclty_answered: int):
	#adds the number of correctly answered questions to the correct tree var
	match last_quiz_tree:
		"TREE1":
			tree1_correct += correclty_answered
		"TREE2":
			tree2_correct += correclty_answered
		"TREE3":
			tree3_correct += correclty_answered
			
	asl_quiz_ui.hide()
	asl_quiz_ui.process_mode = Node.PROCESS_MODE_INHERIT
	get_tree().paused = false

func end_learning():
	asl_learning_ui.hide()
	asl_learning_ui.process_mode = Node.PROCESS_MODE_INHERIT
	get_tree().paused = false

#adds all tree data to tree_data array.
#emits signal with array of tree data.
func set_tree_data():
	tree_data.set(0,tree1_total_questions)
	tree_data.set(1,tree1_correct)
	tree_data.set(2,tree2_total_questions)
	tree_data.set(3,tree2_correct)
	tree_data.set(4,tree3_total_questions)
	tree_data.set(5,tree3_correct)
	SignalHub.emit_tree_data(tree_data)

func quit_game():
	get_tree().quit()

#add object to in_zone
func player_entered_interactable_zone(object: String):
	print("Character entered:",object)
	in_zone.append(object)

#remove object from in_zone
func player_left_interactable_zone(object: String):
	print("Character left:",object)
	in_zone.erase(object)

#sets either learning_ui and quiz_ui to inherit pause effect.
func pause_game():
	if(get_tree().paused == true):
		asl_learning_ui.process_mode = Node.PROCESS_MODE_INHERIT
		asl_quiz_ui.process_mode = Node.PROCESS_MODE_INHERIT


func unpause_game():
	if asl_learning_ui.visible == true || asl_quiz_ui.visible == true:
		get_tree().paused = true
		#asl_learning_ui.process_mode = Node.PROCESS_MODE_ALWAYS
		#asl_quiz_ui.process_mode = Node.PROCESS_MODE_ALWAYS
	else:
		get_tree().paused = false


	
