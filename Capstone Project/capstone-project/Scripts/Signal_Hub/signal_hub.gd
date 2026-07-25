extends Node

signal player_entered_zone(zone: String)
signal player_left_zone(zone: String)
signal tree_learned(difficulty: int)
signal quiz_finished(total_questions: int,correctly_answered: int,tree_num: int)
signal learning_finished
signal pause_game
signal unpause_game
signal quit_game
signal player_entered_home
signal player_left_home
signal tree_data(data: Array[int])
signal tutorial_completed(step:int)

func emit_player_entered_zone(zone: String):
	player_entered_zone.emit(zone)

func emit_player_left_zone(zone: String):
	player_left_zone.emit(zone)

func emit_tree_learned(difficulty: int):
	tree_learned.emit(difficulty)

func emit_quiz_finished(total_q: int,correct: int,tree: int):
	quiz_finished.emit(total_q, correct, tree)

func emit_learning_finished():
	learning_finished.emit()

func emit_pause_game():
	pause_game.emit()

func emit_unpause_game():
	unpause_game.emit()

func emit_quit_game():
	quit_game.emit()

func emit_player_entered_home():
	player_entered_home.emit()

func emit_player_left_home():
	player_left_home.emit()

func emit_tutorial_completed(step:int):
	tutorial_completed.emit(step)

	
