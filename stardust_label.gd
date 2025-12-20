class_name LabelStardust
extends Label
##displays the current amount of stardust available


## temp function to update the text
func _process(_delta: float) -> void:
	update_text()


func update_text() -> void:
	text = "stardust : %s" %Game.ref.data.stardust
