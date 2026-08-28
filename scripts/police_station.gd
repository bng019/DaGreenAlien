extends TextureButton

func _on_pressed():
	if Global.travels_left > 0:
		Dialogic.start("policeStation")
		Global.travels_left -= 1
	else:
		Dialogic.start("outOfTravels")
