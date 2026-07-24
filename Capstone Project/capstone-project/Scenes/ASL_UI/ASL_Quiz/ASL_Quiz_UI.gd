extends Control
class_name ASL_Quiz_UI

#REQUIRED TO MAKE A MEANING_QUESTION
#PLAYER IS GIVEN A MEANING AND CLICKS ONE OF 4 CORRESPONDING IMAGES
#-----------------------------------------------------------
#ASL MEANINING
@onready var meaning_prompt: Label = $MarginContainer/VBoxContainer/Question_Prompts/MP_background/Meaning_Prompt
#4 DIFFERENT IMAGES CONTAINED W/IN BUTTONS
@onready var button_images: Array[TextureRect] = [
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_A/I_A",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_B/I_B",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_C/I_C",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_D/I_D"
]
#this var is only used to help hide/show meaning_prompt label as needed
@onready var mp_background: ColorRect = $MarginContainer/VBoxContainer/Question_Prompts/MP_background
@onready var meaning_container: HBoxContainer = $"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer"
@onready var image_container: HBoxContainer = $"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container"

#the 4 clickable meaning buttons, used for IP (image prompt) questions
@onready var meaning_buttons: Array[Button] = [
	$"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer/Button_M_A",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer/Button_M_B",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer/Button_M_C",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Meaining ButtonContainer/Button_M_D"
]
#the 4 clickable image buttons, used for MP (meaning prompt) questions
@onready var image_buttons: Array[Button] = [
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_A",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_B",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_C",
	$"MarginContainer/VBoxContainer/Answer_Buttons/Image Button Container/Button_I_D"
]


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
#Is assigned "A","B","C", or "D"
#determines which multiple choice answer is correct
#and is assigned in randomize_correct_answer()
var correct_answer: String
#incremented upon player answering a quiz question correctly.
#should be reset to 0 upon finishing quiz
var answered_correctly: int = 0
var quiz_questions: Array[ASLQuestion]
var quiz_index: int
var current_tree: int

#colors used to flash the answer buttons after a pick is made
const CORRECT_FLASH_COLOR: Color = Color(0.3, 1.0, 0.3, 1.0)
const INCORRECT_FLASH_COLOR: Color = Color(1.0, 0.3, 0.3, 1.0)
const NORMAL_COLOR: Color = Color(1.0, 1.0, 1.0, 1.0)
const FLASH_DURATION: float = 0.6

#prevents extra clicks from registering while the flash/feedback is showing
var input_locked: bool = false

func _ready() -> void:
	randomize_correct_answer()

func start_quiz(questions: Array[ASLQuestion],tree_num:int):
	#Sets the current tree this quiz is for
	current_tree = tree_num
	#clears previosu quiz_questions array
	quiz_questions.clear()
	#creates stores a shallow copy of questions in quiz_questions
	quiz_questions = questions.duplicate()
	#reset quiz_index
	quiz_index = 0
	#resets answered correctly to 0
	answered_correctly = 0
	#prompts next_question to start first question of the quiz
	next_question(quiz_index,quiz_questions)

func next_question(index:int, quiz_question: Array[ASLQuestion]):
	if quiz_index >= quiz_question.size():
		#emits signal that the quiz has finished along with
		#the number of correctly answered questions
		SignalHub.emit_quiz_finished((quiz_index),answered_correctly,current_tree)
		return
	else:
		randomize_question_type(quiz_question.get(index).question)

#Used to show an image prompt question
#ASLQuestion is Array[ASLSign]
#the correct sign is always index 0 in this array
#If question.size() exceeds 4 will throw OTB error
func make_IP_question(question: Array[ASLSign]):
	#set image prompt to correct answers image
	image_prompt.texture = question.get(0).image
	
	#set meaning labels
	match correct_answer:
		"A":
			#Assign correct answer
			meaning_labels.get(0).text = question.get(0).meaning
			#Assign incorrect answers
			meaning_labels.get(1).text = question.get(1).meaning
			meaning_labels.get(2).text = question.get(2).meaning
			meaning_labels.get(3).text = question.get(3).meaning
		"B":
			#Assign correct answer
			meaning_labels.get(1).text = question.get(0).meaning
			#Assign incorrect answers
			meaning_labels.get(0).text = question.get(1).meaning
			meaning_labels.get(2).text = question.get(2).meaning
			meaning_labels.get(3).text = question.get(3).meaning
		"C":
			#Assign correct answer
			meaning_labels.get(2).text = question.get(0).meaning
			#Assign incorrect answers
			meaning_labels.get(1).text = question.get(1).meaning
			meaning_labels.get(0).text = question.get(2).meaning
			meaning_labels.get(3).text = question.get(3).meaning
		"D":
			#Assign correct answer
			meaning_labels.get(3).text = question.get(0).meaning
			#Assign incorrect answers
			meaning_labels.get(1).text = question.get(1).meaning
			meaning_labels.get(2).text = question.get(2).meaning
			meaning_labels.get(0).text = question.get(3).meaning
	
#Used to show a meaning prompt question
#ASLQuestion is Array[ASLSign]
#the correct sign is always index 0 in this array
func make_MP_question(question: Array[ASLSign]):
	#set meaning prompt to correct answers meaning
	meaning_prompt.text = question.get(0).meaning
	#set button images
	match correct_answer:
		"A":
			#Assign correct answer
			button_images.get(0).texture = question.get(0).image
			#Assign incorrect answers
			button_images.get(1).texture = question.get(1).image
			button_images.get(2).texture = question.get(2).image
			button_images.get(3).texture = question.get(3).image
		"B":
			#Assign correct answer
			button_images.get(1).texture = question.get(0).image
			#Assign incorrect answers
			button_images.get(0).texture = question.get(1).image
			button_images.get(2).texture = question.get(2).image
			button_images.get(3).texture = question.get(3).image
		"C":
			#Assign correct answer
			button_images.get(2).texture = question.get(0).image
			#Assign incorrect answers
			button_images.get(1).texture = question.get(1).image
			button_images.get(0).texture = question.get(2).image
			button_images.get(3).texture = question.get(3).image
		"D":
			#Assign correct answer
			button_images.get(3).texture = question.get(0).image
			#Assign incorrect answers
			button_images.get(1).texture = question.get(1).image
			button_images.get(2).texture = question.get(2).image
			button_images.get(0).texture = question.get(3).image

#randomly selects "A","B","C",or "D"
#as the correct answer
func randomize_correct_answer():
	var rand: float = randf()
	if rand <= .25:
		correct_answer = "A"
	if rand >.25 && rand <= .5:
		correct_answer = "B"
	if rand > .5 && rand <= .75:
		correct_answer = "C"
	if rand > .75 && rand <= 1:
		correct_answer = "D"

#used to randomly select whether the question is
#Meaning prompt (MP) or Image prompt (IP
func randomize_question_type(question: Array[ASLSign]):
	
	var rand: float = randf()
	
	if rand < .5:
		mp_background.hide()
		image_container.hide()
		image_prompt.show()
		meaning_container.show()
		make_IP_question(question)
	if rand >= .5:
		image_prompt.hide()
		meaning_container.hide()
		mp_background.show()
		image_container.show()
		make_MP_question(question)

#returns whichever button array is currently being used to answer the question
func get_active_buttons() -> Array[Button]:
	if meaning_container.visible:
		return meaning_buttons
	else:
		return image_buttons

func answer_picked(selected_answer: String):
	#ignore extra clicks while the flash feedback is playing
	if input_locked:
		return
	input_locked = true

	var answer_letters: Array[String] = ["A","B","C","D"]
	var buttons: Array[Button] = get_active_buttons()
	var selected_index: int = answer_letters.find(selected_answer)
	var correct_index: int = answer_letters.find(correct_answer)

	#compares selected answer to correct and increments
	#answered_correctly by 1
	var is_correct: bool = selected_answer == correct_answer
	if is_correct:
		answered_correctly += 1
		buttons[selected_index].modulate = CORRECT_FLASH_COLOR
	else:
		buttons[selected_index].modulate = INCORRECT_FLASH_COLOR
		#also highlight which answer was actually correct
		buttons[correct_index].modulate = CORRECT_FLASH_COLOR

	#disable buttons briefly so the flash color can be seen before advancing
	for button in buttons:
		button.disabled = true

	await get_tree().create_timer(FLASH_DURATION).timeout

	for button in buttons:
		button.modulate = NORMAL_COLOR
		button.disabled = false

	quiz_index += 1
	randomize_correct_answer()
	next_question(quiz_index,quiz_questions)
	input_locked = false

#Image_Buttons used for Meaning Questions
func _on_button_i_a_pressed() -> void:
	answer_picked("A")
func _on_button_i_b_pressed() -> void:
	answer_picked("B")
func _on_button_i_c_pressed() -> void:
	answer_picked("C")
func _on_button_i_d_pressed() -> void:
	answer_picked("D")

#Meaning buttons used for image questions
func _on_button_m_a_pressed() -> void:
	answer_picked("A")
func _on_button_m_b_pressed() -> void:
	answer_picked("B")
func _on_button_m_c_pressed() -> void:
	answer_picked("C")
func _on_button_m_d_pressed() -> void:
	answer_picked("D")
