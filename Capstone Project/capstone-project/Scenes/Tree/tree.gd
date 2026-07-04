extends Area2D

@export var obj_name: String

@onready var level_1: Sprite2D = $"Level 1"
@onready var level_2: Sprite2D = $"Level 2"
@onready var level_3: Sprite2D = $"Level 3"

var interacted_today: bool = false
var growth_stage: int = 1

func _ready() -> void:
	level_1.hide()
	level_2.hide()
	level_3.hide()
	show_growth()

func grow():
	growth_stage += 1
	show_growth()

func regress():
	growth_stage -= 1
	show_growth()

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
		SignalHub.emit_player_entered_zone(obj_name)
