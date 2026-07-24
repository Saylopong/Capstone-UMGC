extends Area2D

class_name ASLtree

@export var obj_name: String

@onready var d_1_t_1: Sprite2D = $D1_T1
@onready var d_1_t_2: Sprite2D = $D1_T2
@onready var d_1_t_3: Sprite2D = $D1_T3
@onready var d_2_t_1: Sprite2D = $D2_T1
@onready var d_2_t_2: Sprite2D = $D2_T2
@onready var d_2_t_3: Sprite2D = $D2_T3
@onready var d_3_t_1: Sprite2D = $D3_T1
@onready var d_3_t_2: Sprite2D = $D3_T2
@onready var d_3_t_3: Sprite2D = $D3_T3

var growth_stage: int = 1
var total_questions: int
var answered_correctly: int


func grow():
	if total_questions != 0:
		if (total_questions >= 12) && (answered_correctly as float/total_questions as float >= .75) && (growth_stage == 1):
			growth_stage = 2
		if (total_questions >= 20) && (answered_correctly as float/total_questions as float >= .75) && (growth_stage == 2):
			growth_stage = 3
		if (answered_correctly as float/total_questions as float <= .5) && (growth_stage != 1):
			growth_stage -= 1
	show_growth()

func show_growth():
	if(growth_stage == 1):
		if(obj_name == "TREE1"):
			d_1_t_1.show()
			d_1_t_2.hide()
			d_1_t_3.hide()
		if(obj_name == "TREE2"):
			d_2_t_1.show()
			d_2_t_2.hide()
			d_2_t_3.hide()
		if(obj_name == "TREE3"):
			d_3_t_1.show()
			d_3_t_2.hide()
			d_3_t_3.hide()
	if(growth_stage == 2):
		if(obj_name == "TREE1"):
			d_1_t_1.hide()
			d_1_t_2.show()
			d_1_t_3.hide()
		if(obj_name == "TREE2"):
			d_2_t_1.hide()
			d_2_t_2.show()
			d_2_t_3.hide()
		if(obj_name == "TREE3"):
			d_3_t_1.hide()
			d_3_t_2.show()
			d_3_t_3.hide()
	if(growth_stage == 3):
		if(obj_name == "TREE1"):
			d_1_t_1.hide()
			d_1_t_2.hide()
			d_1_t_3.show()
		if(obj_name == "TREE2"):
			d_2_t_1.hide()
			d_2_t_2.hide()
			d_2_t_3.show()
		if(obj_name == "TREE3"):
			d_3_t_1.hide()
			d_3_t_2.hide()
			d_3_t_3.show()

#detects when character enters Interact_Zone and emits that it has been entered
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_zone(obj_name)


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_left_zone(obj_name)
