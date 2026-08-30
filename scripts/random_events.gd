extends Node

var events:= [
	"iran_war",
	"well_rested",
	"gain_money",
	"lose_money",
	"nothing_happens",
	"money_fairy"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func roll_event():
	# randomly pick from a hashmap. that is the event that we pick. 
	var event_id: String = events.pick_random()
	match event_id:
		"iran_war":
			# increase prices by x%
			Dialogic.start("iranWar")
			pass
		"well_rested":
			# hardcode next day's available actions to 6 instead of 5
			Global.actions_left = 6
			Dialogic.start("extraAction")
			pass
		"gain_money":
			# gain a random amount
			Global.change_money(5)
			Dialogic.start("gainMoney")
			pass
		"lose_money":
			# lose a random amount
			Global.change_money(-5)
			Dialogic.start("loseMoney")
			pass
		"nothing_happens":
			# nothing ever happens
			Dialogic.start("nothingEverHappens")
			pass
		"money_fairy":
			Dialogic.start("moneyFairy")
	return
