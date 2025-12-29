class_name View
extends Control

## Reference to the UI manager
var user_interface : UserInterface
## The specific Enum ID for this window (Must be set in Inspector)
var view : UserInterface.Views

func _ready() -> void:
	# Hide self by default
	visible = false
	
	# Connect to the navigation system automatically
	user_interface = get_parent()
	user_interface.navigation_requested.connect(_on_navigation_requested)

## Handles showing/hiding this window
func _on_navigation_requested(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
	else:
		visible = false
