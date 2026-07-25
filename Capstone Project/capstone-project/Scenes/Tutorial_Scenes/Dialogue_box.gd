extends Node2D
class_name DialogueBox

@onready var tutorial_text: Label = $ColorRect/Tutorial_Text
@onready var color_rect: ColorRect = $ColorRect

const walk_tutorial_text: String = "You can move using\n WASD"
const np_tutorial_text: String = "You can interact by pressing\n\"E\"\nTry opening the newspaper"
const to_farm_tutorial_text: String = "Go outside\n and check on your farm"
const to_home_tutorial_text: String = "Time to head back\n inside"
const bed_tutorial_text: String = "Great job today!\n Its time for bed"
const tree_tutorial_text: String = "Interact with the tree\n to text your knowledge"

func set_text(tutorial: String):
	match tutorial:
		"T_WALK":
			tutorial_text.text = walk_tutorial_text
		"T_TO_FARM":
			tutorial_text.text = to_farm_tutorial_text
		"T_NP":
			tutorial_text.text = np_tutorial_text
		"T_TO_HOME":
			tutorial_text.text = to_home_tutorial_text
		"T_BED":
			tutorial_text.text = bed_tutorial_text
		"T_TREE":
			tutorial_text.text = tree_tutorial_text

func set_background_color(b_color:Color):
	color_rect.color = b_color
