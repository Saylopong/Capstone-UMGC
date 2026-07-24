extends Control

@onready var play_button: Button = $MarginContainer/VBoxContainer/Play_Button
@onready var quit_button: Button = $MarginContainer/VBoxContainer/Quit_Button

func _ready() -> void:
	play_button.pressed.connect(_on_play_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)

func _on_play_button_pressed() -> void:
	SceneTransitioner.game_transition()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
