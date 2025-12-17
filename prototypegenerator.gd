class_name PrototypeGenerator
extends Control
## Generaotr prototype creating stardust every second


## Reference to the label displaying the current about of stardust in storage
@export var label : Label
## Reference to the button starting the generation
@export var button : Button
## Reference to the timer
@export var timer : Timer

## Current amount of stardust in storage
var stardust : int = 0


## ok so i am kinda following a tutorial which makes sense because I have never used godot outside of 1 project from like 3 years ago so im basically a noob
## I need to make this unique later also flip the documentation for now ill do it later
func _ready() -> void:
	update_label_text()



func create_stardust() -> void:
	stardust += 1
	update_label_text()


func update_label_text() -> void:
	label.text = "Stardust : %s" % format_number(stardust)

func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true


func _on_button_pressed() -> void:
	begin_generating_stardust()


func _on_timer_timeout() -> void:
	create_stardust()

func format_number(value: int) -> String:
	if value <1000:
		return str(value)

	var suffixes = ["", "k", "M", "B", "T", "Qa"] # k=Thousand, M=Million, B=Billion...
	var suffix_index = 0
	var current_value = float(value)

	## basically what's happening is that the number is constantly divided by 1000 until the right suffix is found
	while current_value >= 1000.0 and suffix_index < suffixes.size() - 1:
		current_value /= 1000.0
		suffix_index += 1

	## it'll return the number with 1 decimal place (example: "1.5k")
	return "%.1f%s" % [current_value, suffixes[suffix_index]]
