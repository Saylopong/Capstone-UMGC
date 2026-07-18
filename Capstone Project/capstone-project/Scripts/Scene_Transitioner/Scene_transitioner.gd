extends Node

const FARM: PackedScene = preload("uid://cs667hsowc61p")
#const HOME: PackedScene = preload("uid://dcjicbbaddqtb")

#func home_transition() -> void:
	#transition current scen to HOME
#	get_tree().change_scene_to_packed(HOME)

func farm_transition() -> void:
	#transition current scen to FARM
	get_tree().change_scene_to_packed(FARM)
