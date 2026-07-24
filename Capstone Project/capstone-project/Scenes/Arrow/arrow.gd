extends Node2D

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func show_arrow() -> void:
	show()

func hide_arrow() -> void:
	hide()

func set_text(text: String):
	label.text = text
