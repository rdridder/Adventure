extends Area2D
var label = null
var callback = null;

func _ready():
	label = get_parent().get_node("HoverLabel")

func _on_mouse_entered():
	var mousePos = get_local_mouse_position()
	if label.text != "":
		label.position = mousePos
		label.visible = true

func _on_mouse_exited():
	label.visible = false


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT  and event.pressed:
		var parent = get_parent()
		var inventoryItem = parent.get_node("InventoryItem")
		var globalInventory = get_node("/root/GlobalInventory")
		var fadingMessage = parent.get_node("Fadingmessage")
		var image = parent.get_node("Image")
		var area = parent.get_node("Area2D")
		var hoverLabel = parent.get_node("HoverLabel")
		fadingMessage.showMessage()
		globalInventory.get_node("Inventory").add_item(inventoryItem)
		image.visible = false
		area.visible = false
		hoverLabel.visible = false
		
		
		
		
		print(globalInventory)
		
		
		print("Clicked")
		print(event)
		print(shape_idx)
		print(get_tree().get_root())
		if callback != null:
			callback.call()
