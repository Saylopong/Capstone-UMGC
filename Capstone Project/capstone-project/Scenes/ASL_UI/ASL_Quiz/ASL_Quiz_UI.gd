extends Control
class_name ASL_Quiz_UI

#REQUIRED TO MAKE A MEANING_QUESTION
#PLAYER IS GIVEN A MEANING AND CLICKS ONE OF 4 CORRESPONDING IMAGES
#-----------------------------------------------------------
#ASL MEANINING
@onready var image_question: Label = $Image_Question
#4 DIFFERENT IMAGES CONTAINED W/IN BUTTONS
@onready var image_buttons: Array[Button] = [
$"MQ-Images/HBoxContainer2/Image_A",
$"MQ-Images/HBoxContainer2/Image_B",
$"MQ-Images/HBoxContainer2/Image_C",
$"MQ-Images/HBoxContainer2/Image_D"
]

#REQUIRED TO MAKE A IMAGE_QUESTION
#PLAYER SEE'S IMAGE AND CLICKS ON ONE OF 4 CORRESPONDING MEANINGS
#-----------------------------------------------------------
#ASL SIGN IMAGE
@onready var meaning_question: TextureRect = $MarginContainer/Meaning_Question
#4 DIFFERENT MEANING AND CORRESPONDING BUTTONS
@onready var meaning_labels: Array[Label] = [
$"IQ-Meanings/HBoxContainer/ColorRect_A/Label_A",
$"IQ-Meanings/HBoxContainer/ColorRect_B/Label_B",
$"IQ-Meanings/HBoxContainer/ColorRect_C/Label_C",
$"IQ-Meanings/HBoxContainer/ColorRect_D/Label_D"
]
@onready var meaning_buttons: Array[Button] = [
$"IQ-Meanings/HBoxContainer/ColorRect_A/M_Button_A",
$"IQ-Meanings/HBoxContainer/ColorRect_B/M_Button_B",
$"IQ-Meanings/HBoxContainer/ColorRect_C/M_Button_C",
$"IQ-Meanings/HBoxContainer/ColorRect_D/M_Button_D"
]
#assign an int from 0-3 that corresponds to what button the player
#must choose to get the answer correct.
#Example:
#Question? Answers: A, B, C, D
#If correct answer is B - assign 1 to correct_answer
#If correct answer is D - assign 3 to correct_answer
var correct_asnwer: int

#determines what index player is on in the curren quiz
#should be reset with every new quiz
var quiz_index: int = 0

var question_array: Array[ASLGenerator]

#Used to show
func quiz_image(question: ASLGenerator):
	#create a quiz with an image as prompt
	#assign correct meaning (index 0)
	pass

func quiz_meaning(question: ASLGenerator):
	#create a quiz with a meaning as prompt
	#assign correct image (index 0)
	pass

func show_quiz(numb_of_questions:int, difficulty: int):
	#show quiz
	question_array = ASLQuiz.create_quiz(numb_of_questions,difficulty)
	randomize_question_type()
	
func randomize_question_type():
	#cycles through question_array, randomly picking an image or meaning question.
	#increases quiz_index by one each time
	pass

func answer_picked():
	randomize_question_type()
	quiz_index += 1
	pass

func quiz_done():
	#hides UI upon quiz finishing (quiz_index hits end of questions_array)
	pass


#Image_Buttons used for Meaning Questions
func _on_image_d_pressed() -> void:
	pass # Replace with function body.
func _on_image_c_pressed() -> void:
	pass # Replace with function body.
func _on_image_b_pressed() -> void:
	pass # Replace with function body.
func _on_image_a_pressed() -> void:
	pass # Replace with function body.

#Meaning_Buttons used for Image Questions
func _on_m_button_d_pressed() -> void:
	pass # Replace with function body.
func _on_m_button_c_pressed() -> void:
	pass # Replace with function body.
func _on_m_button_b_pressed() -> void:
	pass # Replace with function body.
func _on_m_button_a_pressed() -> void:
	pass # Replace with function body.
