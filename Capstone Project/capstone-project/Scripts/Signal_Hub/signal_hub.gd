extends Node

signal player_entered_zone(zone: String)
signal player_left_zone(zone: String)
signal tree_learned(difficulty: int)
signal quiz_finished(correctly_answered: int)
signal learning_finished
signal pause_game
signal unpause_game
signal quit_game
signal player_entered_home
signal player_left_home
signal tree_data(data: Array[int])

func emit_player_entered_zone(zone: String):
	player_entered_zone.emit(zone)

func emit_player_left_zone(zone: String):
	player_left_zone.emit(zone)

func emit_tree_learned(difficulty: int):
	tree_learned.emit(difficulty)

func emit_quiz_finished(correct: int):
	quiz_finished.emit(correct)

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

func emit_tree_data(data: Array[int]):
	tree_data.emit(data)
	
	
