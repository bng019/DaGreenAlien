extends Node #This is a global script, it autoloads every variable here and every script has access and can read this script
#To see global scripts go to top left Project -> Project Settings -> Globals tab -> Autoload

var resolve := PlayerStats.new() #Initializing Resolve and Hunger in the player_stats.gd script. I made that script to automatically detect when one of these stats hits 0
var hunger := PlayerStats.new()
var player_money := 50
var player_heat := 0
var current_location := ""

var actions_left := 5
var travels_left := 3
var max_actions := 5
var max_travels := 3
var current_day := 1
var catholic := false

signal update_actions(actions_left: int, travels_left: int)
signal start_day(day: int)
signal end_day(day: int)

func _ready():
	resolve.max_value = 100 #First time run when the game starts
	resolve.current = 100
	resolve.depleted.connect(func(): Dialogic.start("died")) #Detects when health hits 0
	
	hunger.max_value = 100 #Max values
	hunger.current = 100
	
	randomize()
	start_day.emit(current_day)

func change_resolve(amount: float) -> void: #Function to call in Dialogic to change resolve
	resolve.current += amount

func change_hunger(amount: float) -> void: #Function to call in Dialogic to change hunger
	hunger.current += amount

func current_resolve() -> float: #Function to call in Dialogic to get current resolve
	return resolve.current
	
func set_resolve_to_max() -> void:
	resolve.current = resolve.max_value
	
func set_hunger_to_max() -> void:
	hunger.current = hunger.max_value

func current_hunger() -> float: #Function to call in Dialogic to get current hunger
	return hunger.current
	
func can_travel() -> bool:
	return travels_left > 0
	
func can_action() -> bool:
	return actions_left > 0
	
func can_action2() -> bool:
	return actions_left > 1


func travel_to(new_location: String) -> bool:
	if Global.current_location == new_location:
		return true
	elif not can_travel():
		return false
	travels_left -= 1
	current_location = new_location
	update_actions.emit(actions_left, travels_left)
	return true

func use_action() -> bool:
	if not can_action():
		return false
	actions_left -= 1
	update_actions.emit(actions_left, travels_left)
	if actions_left <= 0:
		call_deferred("sleep")
	return true

func sleep() -> void:
	end_day.emit(current_day)
	
	current_day += 1
	actions_left = max_actions
	travels_left = max_travels
	
	change_hunger(-20)
	
	update_actions.emit(actions_left, travels_left)
	start_day.emit(current_day)
	
	Dialogic.start("newDay")
	
func coinflip() -> bool:
	var result = randi_range(0, 1)
	return result != 0
	
func is_catholic() -> bool:
	return catholic
