extends Area2D

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

var interacted_today: bool = false
var growth_stage: int = 1

var total_questions: int
var answered_correctly: int

func _ready() -> void:
	SignalHub.tree_data.connect(set_tree_data)
	show_growth()

#sets tree data based on data contained w/in game manager
#checks to see the name this object has been given in order to assign
#correct data.
func set_tree_data(tree_data: Array[int]):
	if(obj_name == "TREE1"):
		total_questions = tree_data.get(0)
		answered_correctly = tree_data.get(1)
	if(obj_name == "TREE2"):
		total_questions = tree_data.get(2)
		answered_correctly = tree_data.get(3)
	if(obj_name == "TREE3"):
		total_questions = tree_data.get(4)
		answered_correctly = tree_data.get(5)
	grow()

func grow():
	if total_questions != 0:
		if total_questions >= 12 && answered_correctly/total_questions >= .75 && growth_stage == 1:
			growth_stage = 2
		if total_questions >= 20 && answered_correctly/total_questions >= .75 && growth_stage == 2:
			growth_stage = 3
		if answered_correctly/total_questions <= .5 && growth_stage != 1:
			regress()
	#print(obj_name," : ",growth_stage)
	#print(obj_name," : ",total_questions)
	#print(obj_name," : ",answered_correctly)
	show_growth()

func regress():
	growth_stage -= 1


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

#detects when player enters Interact_Zone and emits that it has been entered
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_zone(obj_name)


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_left_zone(obj_name)
