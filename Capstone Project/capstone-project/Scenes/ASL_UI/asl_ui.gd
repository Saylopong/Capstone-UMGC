extends Control

#REQUIRED TO MAKE A MEANING_QUESTION
#PLAYER IS GIVEN A MEANING AND CLICKS ONE OF 4 CORRESPONDING IMAGES
#-----------------------------------------------------------
#ASL MEANINING
@onready var image_question: Label = $Image_Question
#4 DIFFERENT IMAGES CONTAINED W/IN BUTTONS
@onready var image_a: Button = $"MQ-Images/HBoxContainer2/Image_A"
@onready var image_b: Button = $"MQ-Images/HBoxContainer2/Image_B"
@onready var image_c: Button = $"MQ-Images/HBoxContainer2/Image_C"
@onready var image_d: Button = $"MQ-Images/HBoxContainer2/Image_D"

#REQUIRED TO MAKE A IMAGE_QUESTION
#PLAYER SEE'S IMAGE AND CLICKS ON ONE OF 4 CORRESPONDING MEANINGS
#-----------------------------------------------------------
#ASL SIGN IMAGE
@onready var meaning_question: TextureRect = $MarginContainer/Meaning_Question
#4 DIFFERENT MEANING AND CORRESPONDING BUTTONS
@onready var label_a: Label = $"IQ-Meanings/HBoxContainer/ColorRect_A/Label_A"
@onready var label_b: Label = $"IQ-Meanings/HBoxContainer/ColorRect_B/Label_B"
@onready var label_c: Label = $"IQ-Meanings/HBoxContainer/ColorRect_C/Label_C"
@onready var label_d: Label = $"IQ-Meanings/HBoxContainer/ColorRect_D/Label_D"
@onready var m_button_a: Button = $"IQ-Meanings/HBoxContainer/ColorRect_A/M_Button_A"
@onready var m_button_b: Button = $"IQ-Meanings/HBoxContainer/ColorRect_B/M_Button_B"
@onready var m_button_c: Button = $"IQ-Meanings/HBoxContainer/ColorRect_C/M_Button_C"
@onready var m_button_d: Button = $"IQ-Meanings/HBoxContainer/ColorRect_D/M_Button_D"

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

var question_array: Array[ASLQuestion]

#Used to show
func quiz_image(question: ASLQuestion):
	#create a quiz with an image as prompt
	#assign correct meaning (index 0)
	pass

func quiz_meaning(question: ASLQuestion):
	#create a quiz with a meaning as prompt
	#assign correct image (index 0)
	pass

func start_quiz(questions: Array[ASLQuestion]):
	question_array = questions
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
