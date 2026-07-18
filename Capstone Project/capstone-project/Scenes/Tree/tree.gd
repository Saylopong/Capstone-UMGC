extends Area2D

@export var obj_name: String

@onready var level_1: Sprite2D = $"Level 1"
@onready var level_2: Sprite2D = $"Level 2"
@onready var level_3: Sprite2D = $"Level 3"

var interacted_today: bool = false
var growth_stage: int = 1

var total_questions: int
var answered_correctly: int

func _ready() -> void:
	SignalHub.tree_data.connect(set_tree_data)
	level_1.hide()
	level_2.hide()
	level_3.hide()
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
		level_1.show()
	if(growth_stage == 2):
		level_2.show()
	if(growth_stage == 3):
		level_3.show()

#detects when player enters Interact_Zone and emits that it has been entered
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_entered_zone(obj_name)


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		SignalHub.emit_player_left_zone(obj_name)
