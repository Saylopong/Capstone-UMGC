extends Node

signal player_entered_zone(zone: String)
signal player_left_zone(zone: String)
signal tree_learned(difficulty: int)

#emitted by Pause_UI, listened to by main/Game_Manager
signal pause_game
signal unpause_game
signal quit_game

#emitted by door Area2D's (Home/Farm), listened to by Scene_Transitioner
#destination is "FARM" or "HOME"
signal door_entered(destination: String)

func emit_player_entered_zone(zone: String):
	player_entered_zone.emit(zone)

func emit_player_left_zone(zone: String):
	player_left_zone.emit(zone)

func emit_tree_learned(difficulty: int):
	tree_learned.emit(difficulty)

func emit_pause_game():
	pause_game.emit()

func emit_unpause_game():
	unpause_game.emit()

func emit_quit_game():
	quit_game.emit()

func emit_door_entered(destination: String):
	door_entered.emit(destination)
