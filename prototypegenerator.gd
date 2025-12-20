class_name PrototypeGenerator
extends Control
## Generaotr prototype creating stardust every second


## Reference to the label displaying the current about of stardust in storage
@export var label : Label
## Reference to the button starting the generation
@export var button : Button
## Reference to the timer
@export var timer : Timer

##reference to the user interface
@export var user_interface : UserInterface
## View reference (this took me 1 hour to fix istg)
@export var view : UserInterface.Views



## ok so i am kinda following a tutorial which makes sense because I have never used godot outside of 1 project from like 3 years ago so im basically a noob
## I need to make this unique later also flip the documentation for now ill do it later (foreshadowing) (mistake)
func _ready() -> void:
	update_label_text()
	
	visible = true
	
	user_interface.navigation_requested.connect(_on_navigation_request)

## temp function to update the label
func _process(_delta: float) -> void:
	update_label_text()


## creates stardust and stores it
func create_stardust() -> void:
	Game.ref.data.stardust += 1


func update_label_text() -> void:
	label.text = "Stardust : %s" % format_number(Game.ref.data.stardust)

func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true


func _on_button_pressed() -> void:
	begin_generating_stardust()


func _on_timer_timeout() -> void:
	create_stardust()

## Watch for navigation requests and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views ) -> void:
	if requested_view == view:
		visible = true
		return
	
	visible = false



## number shortener after this point
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
