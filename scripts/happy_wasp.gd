extends TextureButton

func _on_pressed():
	if Global.travel_to("happyWasp"):
		Dialogic.start("happyWasp")
	else:
		Dialogic.start("outOfTravels")
