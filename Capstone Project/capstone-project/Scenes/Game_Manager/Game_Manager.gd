extends Node

#Actual in scene instantiation of UI's
#we will use .show() and .hide() as needed
@onready var asl_learning_ui: ASL_Learning_UI = $ASL_Learning_UI
@onready var asl_quiz_ui: ASL_Quiz_UI = $ASL_Quiz_UI
@onready var pause_ui: Control = $Pause_UI

@onready var scene_container: MarginContainer = $Scene_Container
@onready var fade_reset_day: AnimationPlayer = $Fade_reset_day
@onready var fade_rect: ColorRect = $fade_rect

#preloads of farm and home scene for quick instantiation
const HOME: PackedScene = preload("uid://uxjg36nseyn0")
const FARM: PackedScene = preload("uid://cs667hsowc61p")

#stores what zones the character is currently in
var in_zone: Array[String]

var last_quiz_tree: String

func _ready() -> void:
	#connects functions to signals
	SignalHub.player_entered_zone.connect(player_entered_interactable_zone)
	SignalHub.player_left_zone.connect(player_left_interactable_zone)
	SignalHub.quiz_finished.connect(end_quiz)
	SignalHub.quit_game.connect(quit_game)
	SignalHub.player_entered_home.connect(load_home)
	SignalHub.player_left_home.connect(load_farm)
	SignalHub.learning_finished.connect(end_learning)
	SignalHub.pause_game.connect(pause_scene)
	SignalHub.unpause_game.connect(unpause_scene)
	load_home()
	
#Instantiates a new farm scene and adds it to scene container
func load_farm():
	if (DataManager.newspaper_interacted):
		clear_scene()
		var farmscene = FARM.instantiate()
		scene_container.add_child.call_deferred(farmscene)
		Sounds.play_wav_sound(DataManager.DOOR_WAV)

#Instantiates a new home scene and adds it to scene container
func load_home():
	clear_scene()
	var homescene = HOME.instantiate()
	scene_container.add_child.call_deferred(homescene)
	if(DataManager.walk_tutorial_shown):
		Sounds.play_wav_sound(DataManager.DOOR_WAV)

#Deques whatever scene is currently being displayed
#in scene container
func clear_scene():
	if(scene_container.get_child_count() == 1):
		scene_container.get_child(0).queue_free()

func _unhandled_input(event: InputEvent) -> void:
	#checks if player pressed "E"
	if event.is_action_pressed("Interact"):
		#checks if player has entered any objects interaction zone.
		if in_zone.size() != 0:
			handle_interact(in_zone.get(0))
	#TEST_ACTION is Shift+T
	elif event.is_action_pressed("TEST_ACTION"):
		print("TEST_ACTION - Scene Disabled")
		scene_container.process_mode = Node.PROCESS_MODE_DISABLED
		#Handle_Interact("TREE1")
		#load_home()

#performs correct action based on what object the player first entered the zone of.
#if the player is in multiple objects zones the others are ignored.
#since godot automatically resizes arrays in_zone.get(0) if in_zone.size() != 0 is
#always valid.
func handle_interact(Interactable: String):
	match Interactable:
		"TREE1":
			if (DataManager.tree_1_interacted == false):
				DataManager.tree_1_interacted = true
				last_quiz_tree = "TREE1"
				asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(DataManager.DB_1.all_questions),1)
				asl_learning_ui.hide()
				asl_quiz_ui.show()
				scene_container.process_mode = Node.PROCESS_MODE_DISABLED
		"TREE2":
			if (DataManager.tree_2_interacted == false) && (DataManager.DB_1.is_learned == true):
				DataManager.tree_2_interacted = true
				asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(DataManager.DB_2.all_questions),2)
				asl_learning_ui.hide()
				asl_quiz_ui.show()
				scene_container.process_mode = Node.PROCESS_MODE_DISABLED
		"TREE3":
			if (DataManager.tree_3_interacted == false) && (DataManager.DB_1.is_learned == true) && (DataManager.DB_2.is_learned == true):
				DataManager.tree_3_interacted = true
				asl_quiz_ui.start_quiz(CreateASLQuiz.new().createQuiz(DataManager.DB_3.all_questions),3)
				asl_learning_ui.hide()
				asl_quiz_ui.show()
				scene_container.process_mode = Node.PROCESS_MODE_DISABLED
		"NEWSPAPER":
			if (DataManager.newspaper_interacted == false):
				DataManager.newspaper_interacted = true
				asl_quiz_ui.hide()
				asl_learning_ui.show()
				show_new_signs()
				Sounds.play_wav_sound(DataManager.PAGE_TURNING_WAV)
		"BED":
			#stops player from going to bed if no trees have been interacted with
			if DataManager.tree_1_interacted || DataManager.tree_2_interacted || DataManager.tree_3_interacted:
				fade_rect.show()
				scene_container.process_mode = Node.PROCESS_MODE_DISABLED
				print("Scene-Disabled - BED")
				fade_reset_day.play("Fade")
				DataManager.bed_tutorial_shown = true
				SignalHub.emit_tutorial_completed(7)
				Sounds.play_mp3_sound(DataManager.COMFORTER_SOUND_MP3)
				


#updates asl_learning_ui with new ASL signs for the player to learn.
#should only show questions that the player has not unlocked from only 1 data base.
func show_new_signs():
	var one_db_used = false
	scene_container.process_mode = Node.PROCESS_MODE_DISABLED
	if(DataManager.DB_1.is_learned == false && one_db_used == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(1))
		asl_learning_ui.show()
		DataManager.DB_1.is_learned_test()
		one_db_used = true
	if(DataManager.DB_1.is_learned && DataManager.DB_2.is_learned == false && one_db_used == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(2))
		asl_learning_ui.show()
		DataManager.DB_2.is_learned_test()
		one_db_used = true
	if(DataManager.DB_1.is_learned && DataManager.DB_2.is_learned && DataManager.DB_3.is_learned == false && one_db_used == false):
		asl_learning_ui.start_learning(CreateASLLearning.createLearning(3))
		asl_learning_ui.show()
		DataManager.DB_3.is_learned_test()
		one_db_used = true
	if(DataManager.DB_1.is_learned && DataManager.DB_2.is_learned && DataManager.DB_3.is_learned):
		#Could show text showing all currently implimented ASL signs have been learned
		pass

func end_quiz(_total_q:int, _correclty_answered: int, _tree:int):
	asl_quiz_ui.hide()
	scene_container.process_mode = Node.PROCESS_MODE_INHERIT

func end_learning():
	asl_learning_ui.hide()
	scene_container.process_mode = Node.PROCESS_MODE_INHERIT

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

#pauses the scene container when pause_scene is called
func pause_scene():
	scene_container.process_mode = Node.PROCESS_MODE_DISABLED
	
func unpause_scene():
	if asl_learning_ui.visible || asl_quiz_ui.visible:
		scene_container.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		scene_container.process_mode = Node.PROCESS_MODE_INHERIT

func _on_fade_reset_day_animation_finished(_anim_name: StringName) -> void:
	DataManager.reset_day()
	unpause_scene()
