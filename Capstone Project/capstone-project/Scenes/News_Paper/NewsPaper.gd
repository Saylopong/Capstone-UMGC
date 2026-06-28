extends Interactable_Object

var interacted_today: bool = false
var interface: ASL_Learning_UI

func learn_new_signs(number_of_signs: int, difficulty: int):
	if(interacted_today == false):
		interface = ASL_Learning_UI.new()
		interface.difficulty = difficulty
		interface.numb_of_signs = number_of_signs
		interface.show_learning()
