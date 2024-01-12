extends CompassScene

@onready var hoverNodes : Dictionary = {"N": $North/NHoverArea2D, "E": $East/EHoverArea2D, "S": $South/SHoverArea2D, "W": $West/WHoverArea2D}
@onready var disableNodes : Dictionary = {"N": $North/NDisabled, "E": $East/EDisabled, "S": $South/SDisabled, "W": $West/WDisabled}
@onready var directions : Dictionary = {}
var nodeForSceneLoading : Node2D = null;

# Called when the node enters the scene tree for the first time.
func _ready():
	setDirections(directions)

func setDirections(directionsInput: Dictionary):
	directions = directionsInput
	if(directions.has("N")):
		setDirectionEnabled("N", true)
	else:
		setDirectionEnabled("N", false)
	if(directions.has("E")):
		setDirectionEnabled("E", true)
	else:
		setDirectionEnabled("E", false)		
	if(directions.has("S")):
		setDirectionEnabled("S", true)
	else:
		setDirectionEnabled("S", false)		
	if(directions.has("W")):
		setDirectionEnabled("W", true)
	else:
		setDirectionEnabled("W", false)		


func setDirectionEnabled(direction : String, enabled : bool):
	var disabledVisible = false;
	var hoverNodeVisible = true;
	if(!enabled):
		disabledVisible = true;
		hoverNodeVisible = false;
	disableNodes[direction].visible = disabledVisible
	hoverNodes[direction].visible = hoverNodeVisible
	
	
func handleMouseClick(viewport : Window, event : InputEventMouseButton, 
						shape_idx : int, direction : String):
	handleClick(direction)
		
	
	
func hoverCompass(direction: String, visible: bool):
	var hoverNode : Sprite2D = hoverNodes[direction].get_node(direction+"Hover");
	hoverNode.visible = visible

	
func _on_n_hover_area_2d_mouse_entered():
	hoverCompass("N", true)


func _on_n_hover_area_2d_mouse_exited():
	hoverCompass("N", false)


func _on_e_hover_area_2d_mouse_entered():
	hoverCompass("E", true)


func _on_e_hover_area_2d_mouse_exited():
	hoverCompass("E", false)


func _on_s_hover_area_2d_mouse_entered():
	hoverCompass("S", true)


func _on_s_hover_area_2d_mouse_exited():
	hoverCompass("S", false)


func _on_w_hover_area_2d_mouse_entered():
	hoverCompass("W", true)


func _on_w_hover_area_2d_mouse_exited():
	hoverCompass("W", false)


func _on_s_hover_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handleMouseClick(viewport, event, shape_idx, "S")


func _on_e_hover_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handleMouseClick(viewport, event, shape_idx, "E")


func _on_n_hover_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handleMouseClick(viewport, event, shape_idx, "N")


func _on_w_hover_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handleMouseClick(viewport, event, shape_idx, "W")
