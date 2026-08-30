extends TextureButton

func _on_pressed():
	if Global.travel_to("hs_Town"):
		Dialogic.start("hsTown")
	else:
		Dialogic.start("outOfTravels")
