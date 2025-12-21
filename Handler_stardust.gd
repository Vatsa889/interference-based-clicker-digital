class_name HandlerStardust
extends Node

## manages stardust and other closely linked signals

static var ref : HandlerStardust

signal stardust_created(quantity : int)
signal stardust_consumed(quantity : int)

func _enter_tree() -> void:
	if not ref: 
		ref = self
		return
	
	queue_free()

## returns the amount of stardust available
func stardust() -> int:
	return Game.ref.data.stardust

##Create a specific amount of stardust
func create_stardust(quantity : int) -> void:
	Game.ref.data.stardust += quantity
	stardust_created.emit(quantity)

##eats a certain amount of stardust/ I am so hungry rn
func consume_stardust(quantity : int) -> Error:
	if quantity > Game.ref.data.stardust:
		return Error.FAILED
	
	Game.ref.data.stardust -= quantity
	stardust_consumed.emit(quantity)
	return Error.OK
