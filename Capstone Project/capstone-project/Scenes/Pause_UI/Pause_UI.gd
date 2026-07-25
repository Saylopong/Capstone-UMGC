extends Control


@onready var quit_button: Button = $MarginContainer/VBoxContainer/Quit_Button
@onready var main_menu_button: Button = $MarginContainer/VBoxContainer/Main_Menu_Button
@onready var h_slider: HSlider = $MarginContainer/VBoxContainer/Volume/HSlider

func _ready() -> void:
	#hidden until the player presses the pause key
	hide()
	quit_button.pressed.connect(_on_quit_button_pressed)
	main_menu_button.pressed.connect(_on_main_menu_button_pressed)
	SignalHub.pause_game.connect(_on_pause_game)
	SignalHub.unpause_game.connect(_on_unpause_game)
	adjust_slider()
	

#checks unhandled input for the pause button and emits pause/unpause via SignalHub
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		if visible:
			SignalHub.emit_unpause_game()
		else:
			SignalHub.emit_pause_game()

func adjust_slider():
	h_slider.value = Sounds.volume + 100

func _on_pause_game() -> void:
	get_tree().paused = true
	show()
	

func _on_unpause_game() -> void:
	get_tree().paused = false
	hide()
	

func _on_quit_button_pressed() -> void:
	SignalHub.emit_quit_game()

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	hide()
	SceneTransitioner.main_menu_transition()


func _on_h_slider_value_changed(value: float) -> void:
	Sounds.change_volume(h_slider.value)
