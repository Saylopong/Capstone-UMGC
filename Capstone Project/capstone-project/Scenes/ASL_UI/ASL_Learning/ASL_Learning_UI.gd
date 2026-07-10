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

func start_learning(new_signs: Array[ASLSign]):
	
	for i in range(new_signs.size()):
		asl_images.get(i).texture = new_signs.get(i).image
		meanings.get(i).text = new_signs.get(i).meaning
