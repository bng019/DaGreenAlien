extends TextureButton #Script for the store button. To see where all the buttons are located, click on 2D above and cycle through the buttons (locations) in the menu far left

func _on_pressed():
	if Global.store_closed == false:
		Dialogic.start("store")
	else:
		Dialogic.start("storeClosed")
