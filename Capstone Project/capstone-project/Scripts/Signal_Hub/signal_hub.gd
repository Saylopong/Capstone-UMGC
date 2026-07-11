extends Node

signal player_entered_zone(zone: String)
signal player_left_zone(zone: String)
signal tree_learned(difficulty: int)
signal quiz_finished(correctly_answered: int)

func emit_player_entered_zone(zone: String):
	player_entered_zone.emit(zone)

func emit_player_left_zone(zone: String):
	player_left_zone.emit(zone)

func emit_tree_learned(difficulty: int):
	tree_learned.emit(difficulty)

func emit_quiz_finished(correct: int):
	quiz_finished.emit(correct)
