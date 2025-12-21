class_name LabelStardust
extends Label
##displays the current amount of stardust available


## connectying signaless
func _ready() -> void:
	update_text()
	
	HandlerStardust.ref.stardust_created.connect(update_text)
	HandlerStardust.ref.stardust_consumed.connect(update_text)

# there's the _quantity arguement there to match the signal
# the default is set to -1 so I have to manually review it without any agruements
func update_text(_quantity : int = -1) -> void:
	text = "stardust : %s" %Game.ref.data.stardust
## guess what
## what
## chicken butt
## you got me there
## BAHAHAHAHHAHA
## what
## wait will the reviewer guy see this
