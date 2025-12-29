class_name Up01ClickerUpgrade
extends Upgrade

func _init() -> void:
	# Initialize the values defined in the parent class
	title = "Clicker Upgrade"
	base_cost = 5
	calculate_cost()
	
	# Initialize saved level data
	level = Game.ref.data.up01_level

# Override the parent description method
func description() -> String:
	var desc : String = "Increases Stardust per click.\n"
	desc += "Effect: +1 Stardust per level\n"
	desc += "Cost: " + str(cost)
	return desc

# Override the parent cost calculation
func calculate_cost() -> void:
	# Note: We use 'cost' now, not 'current_cost'
	cost = int(base_cost * pow(1.5, level))

# Override the parent afford check
func can_afford() -> bool:
	# FIXED: Indentation is now tabs, and variable is 'cost'
	if Game.ref.data.stardust >= cost:
		return true
	return false

# Override the parent purchase logic
func level_up() -> void:
	var error = HandlerStardust.ref.consume_stardust(cost)
	if not error:
		level += 1
		Game.ref.data.up01_level = level
		calculate_cost()
		leveled_up.emit()
