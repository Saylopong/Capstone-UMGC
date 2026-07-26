extends Container

@onready var h_slider: HSlider = $VBoxContainer/MarginContainer/HSlider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	h_slider.set_value_no_signal(DataManager.get_volume_slider_value())

func set_value():
	h_slider.set_value_no_signal(DataManager.get_volume_slider_value())

func _on_h_slider_value_changed(value: float) -> void:
	DataManager.set_volume_from_slider(value)
