extends TextureButton #Button

func _on_pressed(): #When this button gets clicked, starts the shadyAlleyway Dialogic
	if Global.travels_left > 0:
		Dialogic.start("shadyAlleyway")
		Global.travels_left -= 1
	else:
		Dialogic.start("outOfTravels")
