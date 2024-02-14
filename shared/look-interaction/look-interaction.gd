@tool
extends Node2D

@export_group("Look interaction id")
@export var dialogId : String = "":
	set(newDialogId):
		dialogId = newDialogId
		update_configuration_warnings()
	
func _ready():
	update_configuration_warnings()	
	
func _get_configuration_warnings() -> PackedStringArray:
	if dialogId == null || dialogId == "":
		return PackedStringArray(["Please set an id for the look Interaction. " \
		+ "This id will be used in the event to trigger the correct action."])
	return PackedStringArray()
	
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Emitted look interaction")
		EventBus.interaction_triggered.emit(dialogId, InteractionEnum.LOOK)
