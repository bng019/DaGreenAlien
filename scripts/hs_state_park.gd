extends TextureButton

func _on_pressed():
	if Global.travel_to("hs_state_park"):
		Dialogic.start("hsStatePark")
	else:
		Dialogic.start("outOfTravels")
