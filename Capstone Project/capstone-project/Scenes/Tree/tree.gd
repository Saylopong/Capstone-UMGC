extends Interactable_Object

@export var question_count: int
@export var question_difficulty: int

@onready var level_1: Sprite2D = $"Level 1"
@onready var level_2: Sprite2D = $"Level 2"
@onready var level_3: Sprite2D = $"Level 3"

var interacted_today: bool = false
var growth_stage: int = 1
var interface: ASL_Quiz_UI

func _ready() -> void:
	show_growth()

func createQuiz():
	if(interacted_today == false):
		interface = ASL_Learning_UI.new()
		interface.difficulty = difficulty
		interface.numb_of_signs = number_of_signs
		interface.show_learning()
	pass

func grow():
	growth_stage += 1
	show_growth()

func regress():
	growth_stage -= 1
	show_growth()

func show_growth():
	if(growth_stage == 1):
		level_1.show()
	if(growth_stage == 2):
		level_2.show()
	if(growth_stage == 3):
		level_3.show()
	
	
