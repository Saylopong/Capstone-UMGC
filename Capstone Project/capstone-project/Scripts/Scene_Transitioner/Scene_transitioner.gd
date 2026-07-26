extends Node

const MAIN_MENU = preload("uid://db6osn8joy50e")
const GAME_MANAGER = preload("uid://c5g8ymxdt2tl0")

func main_menu_transition() -> void:
	#make sure the game isn't left paused when we leave it
	get_tree().paused = false
	#transition current scene to the main menu
	get_tree().change_scene_to_packed(MAIN_MENU)

func game_transition() -> void:
	#transition current scene to the main gameplay (Game_Manager)
	get_tree().change_scene_to_packed(GAME_MANAGER)
