extends Node #This is a global script, it autoloads every variable here and every script has access and can read this script
#To see global scripts go to top left Project -> Project Settings -> Globals tab -> Autoload

var resolve := PlayerStats.new() #Initializing Resolve and Hunger in the player_stats.gd script. I made that script to automatically detect when one of these stats hits 0
var hunger := PlayerStats.new()
var player_money := 50

var store_closed = false

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

func close_store() -> void: #Function to close the store from being chosen. New Dialogic choice now
	var store_closed = true
