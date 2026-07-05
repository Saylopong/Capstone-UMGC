extends Control
class_name ASL_Quiz_UI

#REQUIRED TO MAKE A MEANING_QUESTION
#PLAYER IS GIVEN A MEANING AND CLICKS ONE OF 4 CORRESPONDING IMAGES
#-----------------------------------------------------------
#ASL MEANINING
@onready var meaning_prompt: Label = $MarginContainer/VBoxContainer/Question_Prompts/txt_background/Meaning_Prompt
#4 DIFFERENT IMAGES CONTAINED W/IN BUTTONS
@onready var image_buttons: Array[Button] = [
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_A/I_A",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_B/I_B",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_C/I_C",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_D/I_D"
]
#this var is only used to help hide/show meaning_prompt label as needed
@onready var mp_background: ColorRect = $MarginContainer/VBoxContainer/Question_Prompts/MP_background


#REQUIRED TO MAKE A IMAGE_QUESTION
#PLAYER SEE'S IMAGE AND CLICKS ON ONE OF 4 CORRESPONDING MEANINGS
#-----------------------------------------------------------
#ASL SIGN IMAGE
@onready var image_prompt: TextureRect = $MarginContainer/VBoxContainer/Question_Prompts/Image_Prompt
#4 DIFFERENT MEANINGS
@onready var meaning_labels: Array[Label] = [
	$"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer/Button_M_A/Meaning_A",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer/Button_M_B/Meaning_B",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer/Button_M_C/Meaning_C",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer/Button_M_D/Meaning_D"
]

#assign "A","B","C",or "D" to correct_answer
#Example:
#Question? Answers: A, B, C, D
#If correct answer is B - assign "B" to correct_answer
#If correct answer is D - assign "D" to correct_answer
var correct_asnwer: String

#incremented upon player answering a quiz question correctly.
#should be reset to 0 upon finishing quiz
var answered_correctly: int = 0

#Used to show
func make_IP_question():
	#create a quiz with an image as prompt
	#assign correct meaning (index 0)
	pass

func make_meaning_question():
	#create a quiz with a meaning as prompt
	#assign correct image (index 0)
	pass

func start_quiz(quiz_questions: Array[ASLQuestion]):
	for ASLQuestion in quiz_questions:
		randomize_question_type(ASLQuestion)
	
	#need to emit signal here through signal hub that tells game_manager
	#how many questions were answered correctly
	
func randomize_question_type(question: ASLQuestion):
	#randomly creates an image question or meaning question
	pass

func answer_picked(selected_answer: String):
	#should compare selected answer to correct and should increment
	#answered_correctly by 1
	pass


#Image_Buttons used for Meaning Questions
func _on_image_d_pressed() -> void:
	answer_picked("D")
func _on_image_c_pressed() -> void:
	answer_picked("C")
func _on_image_b_pressed() -> void:
	answer_picked("B")
func _on_image_a_pressed() -> void:
	answer_picked("A")

#Meaning_Buttons used for Image Questions
func _on_m_button_d_pressed() -> void:
	answer_picked("D")
func _on_m_button_c_pressed() -> void:
	answer_picked("C")
func _on_m_button_b_pressed() -> void:
	answer_picked("B")
func _on_m_button_a_pressed() -> void:
	answer_picked("A")
