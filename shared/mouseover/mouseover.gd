extends Area2D
var image = null
var label = null
var callback = null;

func _ready():
	image = get_parent().get_node("Image")
	label = get_parent().get_node("HoverLabel")

func _on_mouse_entered():
	var mousePos = get_local_mouse_position()
	image.visible = true
	if label.text != "":
		label.position = mousePos
		label.visible = true

func _on_mouse_exited():
	image.visible = false
	label.visible = false


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT  and event.pressed:
		print("Clicked")
		print(event)
		print(shape_idx)
		print(get_tree().get_root())
		if callback != null:
			callback.call()
