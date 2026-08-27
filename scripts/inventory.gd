extends Node #Inventory script

signal item_added(item_id: String)
signal item_removed(item_id: String)

var items: Array[ItemInstance] = []

var item_prices := {
	"Crowbar": 15,
}

func add_item(item_id: String, amount: int = 1, durability: int = -1) -> void: #Add item function, call is Inventory.add_item("Crowbar, 1, 50"). 1 Crowbar of 50 durability. Inventory.add_item("Crowbar") adds one Crowbar and doesn't track durability
	var existing := _find_item(item_id)
	if existing and durability == -1:
		existing.count += amount
	else:
		items.append(ItemInstance.new(item_id, amount, durability))
	item_added.emit(item_id)

func has_item(item_id: String) -> bool:
	return _find_item(item_id) != null

func remove_item(item_id: String, amount: int = 1) -> void:
	var existing := _find_item(item_id)
	if not existing:
		return
	existing.count -= amount
	if existing.count <= 0:
		items.erase(existing)
	item_removed.emit(item_id)
	
func sell_item(item_id: String, amount: int = 1) -> void:
	var existing := _find_item(item_id)
	if not existing or existing.count < amount:
		return
	
	if not item_prices.has(item_id):
		push_warning("Cannot sell item")
		
	var total_price: int = item_prices[item_id] * amount
	remove_item(item_id, amount)
	Global.player_money += total_price

func get_items_string() -> String:
	if items.is_empty():
		return ""
	var names: Array[String] = []
	for item in items:
		names.append(item.item_id)
	return ", ".join(names)

func _find_item(item_id: String) -> ItemInstance:
	for item in items:
		if item.item_id == item_id:
			return item
	return null
