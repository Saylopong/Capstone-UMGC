extends Node

#represents question/learning bank for each tree
var DB_1:ASLDataBase = preload("uid://drtj5oug2qd1u")
var DB_2:ASLDataBase = preload("uid://bca7q66w0hmaj")
var DB_3:ASLDataBase = preload("uid://05t2ycw2ur2m")
#USED FOR TESTING ONLY
#var DB_1:ASLDataBase = preload("uid://srxmjs05hjoh")

const MUSIC = preload("uid://cenepntoffybw")

#Game_Data
var tree_1_total_questions: int = 0
var tree_1_total_correct: int = 0
var tree_1_interacted: bool = false
var tree_2_total_questions: int = 0 
var tree_2_total_correct: int = 0 
var tree_2_interacted: bool = false
var tree_3_total_questions: int = 0
var tree_3_total_correct: int = 0
var tree_3_interacted: bool = false
var newspaper_interacted: bool = false
var walk_tutorial_shown: bool = false
var np_tutorial_shown: bool = false
var bed_tutorial_shown: bool = false
var to_farm_tutorial_shown: bool = false
var tree_tutorial_shown: bool = false
var to_home_tutorial_shown: bool = false
var quiz_tutorial_shown: bool = false
var continue_game1: bool = false


#used to determine volume of sounds in game
#is max volume at -10
#is lowest volume at -50
var volume: float = -25.0

#stores current index in Music of the song currently playing
var current_song: Music 

#WAV sound effects
const PAGE_TURNING_WAV = preload("uid://jo4232vfyyk8")
const DOOR_WAV = preload("uid://bvbjynxcukx43")
#OGG sound effects
#MP3 sound effects
const COMFORTER_SOUND_MP3 = preload("uid://d0ukkbpq7e2dg")


func _ready() -> void:
	SignalHub.quiz_finished.connect(quiz_finished)
	#shuffles all music
	MUSIC.list.shuffle()
	current_song = MUSIC.list.get(0)
	
func quiz_finished(total_questions:int, total_correct:int,tree:int):
	if(tree == 1):
		tree_1_total_questions += total_questions
		tree_1_total_correct += total_correct
		tree_1_interacted = true
	if(tree == 2):
		tree_2_total_questions += total_questions
		tree_2_total_correct += total_correct
		tree_2_interacted = true
	if(tree == 3):
		tree_3_total_questions += total_questions
		tree_3_total_correct += total_correct
		tree_3_interacted = true

func reset_day():
	tree_1_interacted = false
	tree_2_interacted = false
	tree_3_interacted = false
	newspaper_interacted = false

#used to determine the value of the slider bar for volume
func get_volume_slider_value() -> float:
	var slider_value: float
	slider_value =(volume+50.0) * 2.5
	return slider_value

func set_volume_from_slider(slider_value: float):
	volume = (slider_value/2.5) -50.0
	SignalHub.emit_volume()

func reset_game():
	tree_1_total_questions = 0
	tree_1_total_correct = 0
	tree_1_interacted = false
	tree_2_total_questions = 0 
	tree_2_total_correct = 0 
	tree_2_interacted = false
	tree_3_total_questions = 0
	tree_3_total_correct = 0
	tree_3_interacted = false
	newspaper_interacted = false
	walk_tutorial_shown = false
	np_tutorial_shown = false
	bed_tutorial_shown = false
	to_farm_tutorial_shown = false
	tree_tutorial_shown = false
	to_home_tutorial_shown = false
	quiz_tutorial_shown = false
	continue_game1 = false
	reset_data_bases()

func reset_data_bases():
	DB_1.is_learned = false
	DB_2.is_learned = false
	DB_3.is_learned = false
	for x:ASLSign in DB_1:
		x.is_unlocked = false
	for x:ASLSign in DB_2:
		x.is_unlocked = false
	for x:ASLSign in DB_3:
		x.is_unlocked = false
