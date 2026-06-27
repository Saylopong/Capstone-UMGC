extends Resource
class_name ASL_data_set

@export var meaning: String
@export var image: Texture2D

func get_meaning() -> String:
	return meaning

func get_image() -> Texture2D:
	return image
