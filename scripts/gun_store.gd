extends TextureButton

func _on_pressed():
	if Global.travel_to("gunStore"):
		Dialogic.start("gunStore")
	else:
		Dialogic.start("outOfTravels")
