extends TextureButton #Script for the store button. To see where all the buttons are located, click on 2D above and cycle through the buttons (locations) in the menu far left

func _on_pressed():
	if Dialogic.VAR.is_store_closed == true:
		Dialogic.start("storeClosed")
	elif Global.travel_to("hsWholesale") == false:
		Dialogic.start("outOfTravels")
	else:
		Dialogic.start("hsWholesale")
