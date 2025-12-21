class_name prototypeclicker
extends Control
## A clicker prototype that creates stardust

##reference to the user interface
@export var user_interface : UserInterface
## View reference
@export var view : UserInterface.Views

## the next 3 lines are a part of the shop
@export var upgrade_label : Label # Link this to your new upgrade button label
var click_value : int = 1 # Tracks how strong your click is (starts at 1)
var upgrade_cost : int = 10 # Tracks how much the upgrade costs



func _ready() -> void: # determine the stardust value when launched
	visible = false
	
	user_interface.navigation_requested.connect(_on_navigation_request)

## creates stardust
func create_stardust() -> void: # to create the shortest function, function syntax, name of the function, parenthase, and colon to begin the indent block
	HandlerStardust.ref.create_stardust(click_value)

## triggered when the create stardust button is pressed
func _on_button_pressed() -> void:
	create_stardust()

## updates the text of the upgrade label
func update_upgrade_label() -> void:
	if upgrade_label: #quick check to see if it is assigned
		upgrade_label.text = "Upgrade (Cost: %s)" %upgrade_cost

##triggered when the new upgrade button is pressed
func _on_upgrade_button_pressed() -> void:
	if Game.ref.data.stardust >= upgrade_cost: # check if we can afford it
		Game.ref.data.stardust -= upgrade_cost # pay the cost
		click_value += 1 # increase click strength
		upgrade_cost *= 2 # make next one more expensive 
		
		## refresh single label now
		update_upgrade_label()
## I think I fixed it

## Watch for navigation requests and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	
	visible = false
