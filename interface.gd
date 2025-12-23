class_name UserInterface
extends Control
## main class controlling the user interface


##list of views
enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
}


## emitted when something requested navigation, includes the view target
signal navigation_requested(view : Views)
## I fixed it I am sad now


## triggered when the prototype generator link is clicked
func _on_prototypegeneratorlink_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

## triggered when the prototype clicker link is clicked
func _on_prototypeclickerlink_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)
