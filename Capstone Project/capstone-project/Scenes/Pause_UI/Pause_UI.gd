extends Control


@onready var quit_button: Button = $MarginContainer/VBoxContainer/Quit_Button

func _ready() -> void:
	#hidden until the player presses the pause key
	hide()
	quit_button.pressed.connect(_on_quit_button_pressed)
	SignalHub.pause_game.connect(_on_pause_game)
	SignalHub.unpause_game.connect(_on_unpause_game)

#checks unhandled input for the pause button and emits pause/unpause via SignalHub
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		if visible:
			SignalHub.emit_unpause_game()
		else:
			SignalHub.emit_pause_game()


func _on_pause_game() -> void:
	get_tree().paused = true
	show()
	

func _on_unpause_game() -> void:
	get_tree().paused = false
	hide()
	

func _on_quit_button_pressed() -> void:
	SignalHub.emit_quit_game()
