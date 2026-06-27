extends Node

const MAIN = preload("uid://c5g8ymxdt2tl0")
const FARM = preload("uid://cs667hsowc61p")
const HOME = preload("uid://dcjicbbaddqtb")

func main_transition() -> void:
	#transition current scen to MAIN
	get_tree().change_scene_to_packed(MAIN)

func home_transition() -> void:
	#transition current scen to HOME
	get_tree().change_scene_to_packed(HOME)

func farm_transition() -> void:
	#transition current scen to FARM
	get_tree().change_scene_to_packed(FARM)
