class_name Upgrade
extends Node

## Abstract Base Class for all upgrades

var level : int = -1
var title : String = "Undefined"
var base_cost : int = -1
var cost : int = -1

## Signal emitted when this upgrade is purchased
signal leveled_up

## VIRTUAL: Returns the description text. Must be overridden by child.
func description() -> String:
	printerr("Method 'description' not defined in child upgrade.")
	return ""

## VIRTUAL: Calculates cost based on level. Must be overridden.
func calculate_cost() -> void:
	printerr("Method 'calculate_cost' not defined.")

## VIRTUAL: Checks if player can buy. Must be overridden.
func can_afford() -> bool:
	return false

## VIRTUAL: Performs purchase logic. Must be overridden.
func level_up() -> void:
	printerr("Method 'level_up' not defined.")
