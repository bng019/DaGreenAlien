extends Node

signal item_added(item_id: String)
signal item_removed(item_id: String)

var items: Array[String] = []

func add_item(item_id: String) -> void:
	if item_id not in items:
		items.append(item_id)
		item_added.emit(item_id)

func has_item(item_id: String) -> bool:
	return item_id in items

func remove_item(item_id: String) -> void:
	if item_id in items:
		items.erase(item_id)
		item_removed.emit(item_id)

func get_items_string() -> String:
	if items.is_empty():
		return ""
	return ", ".join(items)
