@icon("res://classes/icons/compass.png")
class_name CompassScene extends Node2D


@onready var _hoverNodes : Dictionary = {"N": $North/NHoverArea2D, "E": $East/EHoverArea2D, "S": $South/SHoverArea2D, "W": $West/WHoverArea2D}
@onready var _disableNodes : Dictionary = {"N": $North/NDisabled, "E": $East/EDisabled, "S": $South/SDisabled, "W": $West/WDisabled}
@onready var _directions : Dictionary = {}


var _clickCallback : Callable
var _handlingClick : bool


func _ready():
	setDirections(_directions)


func setDirections(directionsInput: Dictionary):
	_directions = directionsInput
	if(_directions.has("N")):
		setDirectionEnabled("N", true)
	else:
		setDirectionEnabled("N", false)
	if(_directions.has("E")):
		setDirectionEnabled("E", true)
	else:
		setDirectionEnabled("E", false)		
	if(_directions.has("S")):
		setDirectionEnabled("S", true)
	else:
		setDirectionEnabled("S", false)		
	if(_directions.has("W")):
		setDirectionEnabled("W", true)
	else:
		setDirectionEnabled("W", false)		


func setDirectionEnabled(direction : String, enabled : bool):
	print("enable "+direction)
	var disabledVisible = false;
	var hoverNodeVisible = true;
	if(!enabled):
		disabledVisible = true;
		hoverNodeVisible = false;
	_disableNodes[direction].visible = disabledVisible
	_hoverNodes[direction].visible = hoverNodeVisible
	
	
func handleMouseClick(viewport : Window, event : InputEventMouseButton, 
						shape_idx : int, direction : String):
	handleClick(direction)
		
	
	
func hoverCompass(direction: String, visible: bool):
	var hoverNode : Sprite2D = _hoverNodes[direction].get_node(direction+"Hover");
	hoverNode.visible = visible


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
