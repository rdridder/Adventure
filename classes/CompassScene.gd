@icon("res://classes/icons/compass.png")
class_name CompassScene extends Node2D

var _clickCallback : Callable
var _handlingClick : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setHandlingCLick(handlingClick : bool):
	_handlingClick = handlingClick


func setClickCallback(callback : Callable) -> void:
	_clickCallback = callback

	
func handleClick(direction : String) -> void:
	if(_handlingClick):
		print("Already handling click")
		return
	elif(_clickCallback == null):
		print("Compass click callback not set.")
		return
	_handlingClick = true
	_clickCallback.call(direction)
