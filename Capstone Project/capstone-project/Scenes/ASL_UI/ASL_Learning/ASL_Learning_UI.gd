extends Control
class_name ASL_Learning_UI

#IMAGES
#The image 
@onready var asl_images: Array[TextureRect] = [
	$"MarginContainer/VBoxContainer/Image Container/ASL_Image",
	$"MarginContainer/VBoxContainer/Image Container/ASL_Image2",
	$"MarginContainer/VBoxContainer/Image Container/ASL_Image3",
	$"MarginContainer/VBoxContainer/Image Container/ASL_Image4"
]
#MEANINGS
@onready var meanings: Array[Label] = [
	$"MarginContainer/VBoxContainer/Meaining Container/ColorRect/Meaning",
	$"MarginContainer/VBoxContainer/Meaining Container/ColorRect2/Meaning2",
	$"MarginContainer/VBoxContainer/Meaining Container/ColorRect3/Meaning3",
	$"MarginContainer/VBoxContainer/Meaining Container/ColorRect4/Meaning4"
]
@onready var meaning_backgrounds: Array[ColorRect] = [
	$"MarginContainer/VBoxContainer/Meaining Container/ColorRect",
	$"MarginContainer/VBoxContainer/Meaining Container/ColorRect2",
	$"MarginContainer/VBoxContainer/Meaining Container/ColorRect3",
	$"MarginContainer/VBoxContainer/Meaining Container/ColorRect4"
]

func start_learning(new_signs: Array[ASLSign]):
	hide_all()
	print("SIZE: ",new_signs.size())
	for i in range(new_signs.size()):
		asl_images.get(i).texture = new_signs.get(i).image
		asl_images.get(i).show()
		meanings.get(i).text = new_signs.get(i).meaning
		meaning_backgrounds.get(i).show()

#hide all labels and images
func hide_all():
		for i in 4:
			asl_images.get(i).hide()
			meaning_backgrounds.get(i).hide()


#when pressed game_manager should hide this UI
func _on_button_pressed() -> void:
	if !DataManager.np_tutorial_shown:
		DataManager.np_tutorial_shown = true
		SignalHub.emit_tutorial_completed(3)
	SignalHub.emit_learning_finished()
