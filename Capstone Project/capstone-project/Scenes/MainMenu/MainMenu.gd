extends Control

@onready var play_button: Button = $MarginContainer/VBoxContainer/Play_Button
@onready var quit_button: Button = $MarginContainer/VBoxContainer/Quit_Button
@onready var h_slider: HSlider = $MarginContainer/VBoxContainer/Volume/HSlider

func _ready() -> void:
	play_button.pressed.connect(_on_play_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	Sounds.play_music(Sounds.MIDNIGHT_PILLOW_DRIFT)
	adjust_slider()

func adjust_slider():
	h_slider.value = Sounds.volume + 100
	
func _on_play_button_pressed() -> void:
	SceneTransitioner.game_transition()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
	

func _on_h_slider_value_changed(value: float) -> void:
	Sounds.change_volume(h_slider.value)
