class_name ItemInstance #Class to keep track of amount of items and their durability
extends Resource #Resource scripts are auto global files

@export var item_id: String
@export var count: int = 1
@export var durability: int = -1  # -1 = not applicable (e.g. stackable materials)

func _init(id: String = "", starting_count: int = 1, starting_durability: int = -1) -> void:
	item_id = id
	count = starting_count
	durability = starting_durability
