class_name PrototypeUpgrades
extends View

@onready var container : VBoxContainer = $MarginContainer/VBoxContainer

func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false

func _ready() -> void:
	super._ready() # Call parent setup
	
	# Example upgrade spawning
	add_upgrade(Up01ClickerUpgrade.new())

func add_upgrade(upgrade_data) -> void:
	var new_compo = COMPO_SCENE.instantiate()
	container.add_child(new_compo)
	new_compo.setup(upgrade_data)

const COMPO_SCENE = preload("res://scenes/prototypes/upgrades/components/compo_upgrade.tscn")
