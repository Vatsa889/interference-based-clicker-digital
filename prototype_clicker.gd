class_name prototypeclicker
extends Control
## A clicker prototype that creates stardust


@export var label : Label # made a reference to label button by highlighting label : and going to the root node and then clicking on label

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
