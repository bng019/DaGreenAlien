extends TextureButton #Button

func _on_pressed(): #When this button gets clicked, starts the shadyAlleyway Dialogic
	if Global.travel_to("scHoney"):
		Dialogic.start("scHoney")
	else:
		Dialogic.start("outOfTravels")
