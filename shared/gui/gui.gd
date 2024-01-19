extends Node2D

enum GuiMode {LOOK = 1, GRAB = 2}

var guiMode : GuiMode = GuiMode.LOOK

func _ready():
	EventBus.inventory_items_taken_from_world.connect(pickupWorldItems)
	setButtonTexture()

func _exit_tree() -> void:
	if(EventBus.inventory_items_taken_from_world.is_connected(pickupWorldItems)):
		EventBus.inventory_items_taken_from_world.disconnect(pickupWorldItems)

func pickupWorldItems(items : Array[InventoryItem]) -> void:
	print("pickup world items")
	for item: InventoryItem in items:
		item._inventory.transfer(item, $"InventoryGrid")

func setButtonTexture() -> void:
	var button : TextureButton =  %"ModeButton"
	button.texture_normal = null
	var image : Resource = null
	if(guiMode == GuiMode.LOOK):
		image = load("res://shared/gui/images/eye-xsmall.png")
	else:
		image = load("res://shared/gui/images/hand-xsmall.png")
	button.texture_normal = image	

func _on_close_inventory_button_pressed():
	%InventoryContainer.visible = false


func _on_chest_button_pressed():
	%InventoryContainer.visible = true


func _on_mode_button_pressed():
	if(guiMode == GuiMode.LOOK):
		guiMode = GuiMode.GRAB
	else:
		guiMode = GuiMode.LOOK
	setButtonTexture()
