extends TextureButton

func _on_pressed():
	if Global.travels_left > 0:
		Dialogic.start("gunStore")
		Global.travels_left -= 1
	else:
		Dialogic.start("outOfTravels")
