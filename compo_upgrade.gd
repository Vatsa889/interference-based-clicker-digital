class_name CompoUpgrade
extends PanelContainer

@export var label_title : Label
@export var label_description : RichTextLabel
@export var button_purchase : Button

var upgrade : Up01ClickerUpgrade

func _ready() -> void:
	## Initiallizes the specific upgrade logic
	upgrade = Up01ClickerUpgrade.new()
	
	## updates the UI instantly
	update_title()
	update_description()
	update_button()
	
	## connects the signals
	HandlerStardust.ref.stardust_created.connect(_on_stardust_changed)
	HandlerStardust.ref.stardust_consumed.connect(_on_stardust_changed)
	upgrade.leveled_up.connect(_on_leveled_up)

	## connects the pressed buttons
	button_purchase.pressed.connect(_on_button_pressed)

func update_title() -> void:
	label_title.text = "%s (lvl %s)" % [upgrade.title, upgrade.level]

func update_description() -> void:
	label_description.text = upgrade.description()

func update_button() -> void:
	button_purchase.text = "Purchase (%s)" % upgrade.current_cost
	button_purchase.disabled = not upgrade.can_afford()

## wrapper to match the signal signature (wow my first wrapper)
func _on_stardust_changed(_quantity : int) -> void:
	update_button()

func _on_leveled_up() -> void:
	update_title()
	update_description()
	update_button()

func _on_button_pressed() -> void:
	upgrade.level_up()
