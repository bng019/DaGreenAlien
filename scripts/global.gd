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
var max_travells := 3

func _ready():
	resolve.max_value = 100 #First time run when the game starts
	resolve.current = 100
	resolve.depleted.connect(func(): Dialogic.start("died")) #Detects when health hits 0
	
	hunger.max_value = 100 #Max values
	hunger.current = 100
	
	randomize()

func change_resolve(amount: float) -> void: #Function to call in Dialogic to change resolve
	resolve.current += amount

func change_hunger(amount: float) -> void: #Function to call in Dialogic to change hunger
	hunger.current += amount

func current_resolve() -> float: #Function to call in Dialogic to get current resolve
	return resolve.current

func current_hunger() -> float: #Function to call in Dialogic to get current hunger
	return hunger.current

func change_location(new_location: String) -> void:
	current_location = new_location

func change_money(amount: float) -> void: #Function to call in Dialogic to change money
	player_money += amount
	
func current_money() -> float: #Function to call in Dialogic to get current money
	return player_money
