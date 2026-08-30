extends TextureButton #Button

func _on_pressed(): #When this button gets clicked, displays everything in your inventory in Dialogic
	Dialogic.start("displayInvo")
