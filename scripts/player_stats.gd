class_name PlayerStats
extends Resource #Resource scripts are auto global files

signal value_changed(new_value: float, old_value: float) #If we ever need to access the amount of health lost ex: 70 -> 40 this would return 30
signal depleted #Detects if value hits 0

@export var current: float = 100.0: #Function for the above 2
	set(value):
		var old = current
		current = clamp(value, 0.0, max_value)
		if current != old:
			changed.emit(current, old)
		if current <= 0.0:
			depleted.emit()

@export var max_value: float = 100.0

func add(amount: float) -> void: #Function to change health in normal scripts excluding Dialogic, probably wouldn't use
	current += amount

func percent() -> float: #Function if you want the percent health of current health
	return current / max_value if max_value > 0 else 0.0

func reset() -> void:
	current = max_value
