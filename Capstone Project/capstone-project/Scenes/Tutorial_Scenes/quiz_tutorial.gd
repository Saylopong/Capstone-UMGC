extends Node2D

#emits step 0 to have all functions connceted to
#emit_tutorial_completed to run
#specifically needed for ASLQuiz_UI
func _on_button_m_d_pressed() -> void:
	SignalHub.emit_tutorial_completed(0)
	hide()

func _on_button_m_c_pressed() -> void:
	SignalHub.emit_tutorial_completed(0)
	hide()

func _on_button_m_b_pressed() -> void:
	SignalHub.emit_tutorial_completed(0)
	hide()

func _on_button_m_a_pressed() -> void:
	SignalHub.emit_tutorial_completed(0)
	hide()
