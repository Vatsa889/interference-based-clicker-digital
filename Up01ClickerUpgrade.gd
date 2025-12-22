class_name Up01ClickerUpgrade
extends Node

signal leveled_up

var level : int = 0
var title : String = "Clicker upgrade"
var base_cost : int = 5
var current_cost : int = 0

func _init() -> void:
	# function to load level save data
	level = Game.ref.data.up01_level
	calculate_cost()

## Returns the description with the current effect
func description() -> String:
	var desc : String = "increases stardust created by the clicker.\n"
	desc += "Effect: +1 Starust per level"
	return desc

## level based cost calculator, uses exponential growth
func calculate_cost() -> void:
	current_cost = int(base_cost * pow(1.5, level))

## gives true if the player has enough stardust to upgrade
func can_afford() -> bool:
	if HandlerStardust.ref.stardust() >= current_cost:
		return true
	return false

##
func level_up() -> void:
	var error = HandlerStardust.ref.consume_stardust(current_cost)
	if not error:
		level += 1
		Game.ref.data.up01_level = level #Save to data
		calculate_cost()
		leveled_up.emit()
