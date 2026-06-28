extends Control
class_name ASL_Learning_UI

#IMAGES
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
var difficulty: int
var numb_of_signs: int

func show_learning():
	var asl_signs: Array[ASLGenerator] = ASLQuiz.learn_signs(numb_of_signs,difficulty)
	
	#can throw out of bound errors if nume_of_signs exceeds 4
	for i in range(numb_of_signs):
		asl_images.get(i).texture = asl_signs.get(i).image
		meanings.get(i).text = asl_signs.get(i).meaning
