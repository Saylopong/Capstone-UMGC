extends Node

const FARM: PackedScene = preload("uid://cs667hsowc61p")
const MAIN_MENU: PackedScene = preload("res://Scenes/MainMenu/MainMenu.tscn")
const GAME_MANAGER: PackedScene = preload("res://Scenes/Game_Manager/Game_Manager.tscn")
#const HOME: PackedScene = preload("uid://dcjicbbaddqtb")

#func home_transition() -> void:
	#transition current scen to HOME
#	get_tree().change_scene_to_packed(HOME)

func farm_transition() -> void:
	#transition current scen to FARM
	get_tree().change_scene_to_packed(FARM)

func main_menu_transition() -> void:
	#make sure the game isn't left paused when we leave it
	get_tree().paused = false
	#transition current scene to the main menu
	get_tree().change_scene_to_packed(MAIN_MENU)

func game_transition() -> void:
	#transition current scene to the main gameplay (Game_Manager)
	get_tree().change_scene_to_packed(GAME_MANAGER)
