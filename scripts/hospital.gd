extends TextureButton

func _on_pressed():
	if Global.travel_to("hospital"):
		Dialogic.start("hospital")
	else:
		Dialogic.start("outOfTravels")
