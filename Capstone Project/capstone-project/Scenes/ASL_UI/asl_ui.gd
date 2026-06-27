extends Control

#Allows use of data base imported into ASL_data_set
@export var database: Array[ASL_data_set]

#All 4 TextureRect/buttons in ASL_UI
#Used to display ASL images
@onready var texture_0: TextureRect = $Texture_1
@onready var texture_1: TextureRect = $Texture_2
@onready var texture_2: TextureRect = $Texture_3
@onready var texture_3: TextureRect = $Texture_4
@onready var question: Label = $Question

#Stores number of correct answer
var correct_answer: int
#stores meaning/phrase of correct answer
var meaning: String

func generate_image_question() -> void:
	generate_correct_answer()
	generate_incorrect_answers()

func generate_correct_answer() -> void:
		#randomly selects a image and meaning pair from the ASL_data_set
	var correct_set: ASL_data_set = database.pick_random()
	
	meaning = correct_set.get_meaning()
	
	#randomly assigns the image from the correct set to a random texturerect
	var x: int = randf_range(0,3)
	if(x < 1):
		texture_0.texture = correct_set.get_image()
		correct_answer = 0
	if((1 <= x) && (x < 2)):
		texture_1.texture = correct_set.get_image()
		correct_answer = 1
	if((2 <= x) && (x < 3)):
		texture_2.texture = correct_set.get_image()
		correct_answer = 2
	if((3 <= x) && (x <4)):
		texture_3.texture = correct_set.get_image()
		correct_answer = 3
		
#Need a way to ensure that the correct_set image is not used here
func generate_incorrect_answers() -> void:
	#generate an image from ASL_data_set to each texture_rect not chosen yet.
	if (correct_answer == 0):
		texture_1.texture = database.pick_random()
		texture_2.texture = database.pick_random()
		texture_3.texture = database.pick_random()
	if (correct_answer == 1):
		texture_0.texture = database.pick_random()
		texture_2.texture = database.pick_random()
		texture_3.texture = database.pick_random()
	if (correct_answer == 2):
		texture_1.texture = database.pick_random()
		texture_0.texture = database.pick_random()
		texture_3.texture = database.pick_random()
	if (correct_answer == 3):
		texture_1.texture = database.pick_random()
		texture_2.texture = database.pick_random()
		texture_0.texture = database.pick_random()

func _on_a_button_pressed() -> void:
	pass # Replace with function body.

func _on_b_button_pressed() -> void:
	pass # Replace with function body.

func _on_c_button_pressed() -> void:
	pass # Replace with function body.

func _on_d_button_pressed() -> void:
	pass # Replace with function body.

func incorrect_choice() -> void:
	#add action for the player making the incorrect choice
	pass

func correct_choice() -> void:
	#add action for the player making the correct choice
	pass
