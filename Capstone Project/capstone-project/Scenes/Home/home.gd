extends Node2D
@onready var news_paper_tutorial: DialogueBox = $News_Paper_Tutorial
@onready var bed_tutorial: DialogueBox = $Bed_Tutorial
@onready var to_farm_tutorial: DialogueBox = $To_Farm_Tutorial
@onready var walk_tutorial: DialogueBox = $Walk_Tutorial
@onready var continue_game: DialogueBox = $Continue_game
@onready var show_continue: Timer = $show_continue
@onready var hide_continue: Timer = $hide_continue

func _ready() -> void:
	hide_tutorials()
	show_tutorials(1)
	SignalHub.tutorial_completed.connect(show_tutorials)

func show_tutorials(step:int):
	if(!DataManager.walk_tutorial_shown && step == 1):
		walk_tutorial.show()
		walk_tutorial.set_text("T_WALK")
	#shows news_paper_tutorial if it has not been shown before
	elif(DataManager.walk_tutorial_shown && !DataManager.np_tutorial_shown && step == 2):
		walk_tutorial.hide()
		news_paper_tutorial.set_text("T_NP") 
		news_paper_tutorial.show()
	#shows to_farm_tutorial if newspaper
	#tutorial has been completed and to_farm_tutorial has not been completed
	elif(DataManager.np_tutorial_shown && !DataManager.to_farm_tutorial_shown && step == 3):
		news_paper_tutorial.hide()
		to_farm_tutorial.show()
		to_farm_tutorial.set_text("T_TO_FARM")
	#shows bed tutorial when player has completed
	#to_home_tutorial
	elif(DataManager.to_home_tutorial_shown && !DataManager.bed_tutorial_shown):
		bed_tutorial.show()
		bed_tutorial.set_text("T_BED")
	elif(DataManager.quiz_tutorial_shown && !DataManager.continue_game1):
		show_continue.start()
		bed_tutorial.hide()
		continue_game.set_text("C1")
		
	else:
		hide_tutorials()
		
func hide_tutorials():
	news_paper_tutorial.hide()
	to_farm_tutorial.hide()
	bed_tutorial.hide()
	walk_tutorial.hide()
	continue_game.hide()

func _on_area_2d_body_entered(body: Node2D) -> void:
		if body is CharacterBody2D:
			SignalHub.emit_player_left_home()

func _on_timer_timeout() -> void:
	continue_game.show()
	hide_continue.start()
	DataManager.continue_game1 = true


func _on_hide_continue_timeout() -> void:
	continue_game.hide()
	
	
