class_name prototypeclicker
extends Control
## A clicker prototype that creates stardust


@export var label : Label # made a reference to label button by highlighting label : and going to the root node and then clicking on label

@export var upgrade_label : Label # Link this to your new upgrade button label
var click_value : int = 1 # Tracks how strong your click is (starts at 1)
var upgrade_cost : int = 10 # Tracks how much the upgrade costs

var stardust : int = 0 #current amount of stardust created


func _ready() -> void: # determine the stardust value when launched
	update_label_text()

## creates stardust
func create_stardust() -> void: # to create the shortest function, function syntax, name of the function, parenthase, and colon to begin the indent block
	stardust += 1
	update_label_text()

## update the text of th label to reflect a change in stardust amount
func update_label_text() -> void:
	label.text = "stardust : %s" %stardust

## triggered when the create stardust button is pressed
func _on_button_pressed() -> void:
	create_stardust()

## updates the text of the upgrade label
func update_upgrade_label() -> void:
	if upgrade_label: #quick check to see if it is assigned
		upgrade_label.text = "Upgrade (Cost: %s)" %upgrade_cost

##triggered when the new upgrade button is pressed
func _on_upgrade_button_pressed() -> void:
	if stardust >= upgrade_cost: # check if we can afford it
		stardust -= upgrade_cost # pay the cost
		click_value += 1 # increase click strength
		upgrade_cost *= 2 # make next one more expensive 
		
		## refresh both labels
		update_label_text()
		update_upgrade_label()
