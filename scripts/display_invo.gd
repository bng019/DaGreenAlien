extends TextureButton #Button

func _on_pressed(): #When this button gets clicked, displays everything in your inventory in Dialogic
	Inventory.add_item("Bullet", 2)
	Inventory.add_item("Gun")
	Inventory.add_item("Nineteen dollar fortnite card", 1, 19)
	Inventory.add_item("Shovel", 1, 50)
	Inventory.add_item("six seven", 67, 67)
	Dialogic.start("displayInvo")
