extends TextureButton

func _on_pressed():
	if Global.travel_to("bar"):
		Dialogic.start("bar")
	else:
		Dialogic.start("outOfTravels")
