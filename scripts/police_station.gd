extends TextureButton

func _on_pressed():
	if Global.travel_to("policeStation"):
		Dialogic.start("policeStation")
	else:
		Dialogic.start("outOfTravels")
