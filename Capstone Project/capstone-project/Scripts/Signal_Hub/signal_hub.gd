extends Node

signal player_entered_zone(zone: String)
signal player_left_zone(zone: String)
signal tree_learned(difficulty: int)

func emit_player_entered_zone(zone: String):
	player_entered_zone.emit(zone)

func emit_player_left_zone(zone: String):
	player_left_zone.emit(zone)

func emit_tree_learned(difficulty: int):
	tree_learned.emit(difficulty)
