extends Node2D

var guiMode = InteractionEnum.LOOK

func _ready():
	EventBus.inventory_items_taken_from_world.connect(pickupWorldItems)
	EventBus.interaction_triggered.connect(interactionTriggered)
	setButtonTexture()
	print("gui ready")

func _exit_tree() -> void:
	if(EventBus.inventory_items_taken_from_world.is_connected(pickupWorldItems)):
		EventBus.inventory_items_taken_from_world.disconnect(pickupWorldItems)

func pickupWorldItems(items : Array[InventoryItem]) -> void:
	print("pickup world items")
	for item: InventoryItem in items:
		item._inventory.transfer(item, $"InventoryGrid")
		
func interactionTriggered(interactionId : String, interactionType : int):
	if(guiMode != interactionType):
		print("Wrong interaction type")
		return
	elif(guiMode == InteractionEnum.LOOK):
		print("Look interaction")
		showDialog(interactionId)
		
func showDialog(dialogId : String):
	# TODO make real text
	EventBus.show_text_box_world_overlay.emit(dialogId)

func setButtonTexture() -> void:
	var button : TextureButton =  %"ModeButton"
	button.texture_normal = null
	var image : Resource = null
	if(guiMode == InteractionEnum.LOOK):
		image = load("res://shared/gui/images/eye-xsmall.png")
	else:
		image = load("res://shared/gui/images/hand-xsmall.png")
	button.texture_normal = image	

func _on_close_inventory_button_pressed():
	%InventoryContainer.visible = false

func _on_chest_button_pressed():
	%InventoryContainer.visible = true

func _on_mode_button_pressed():
	if(guiMode == InteractionEnum.LOOK):
		guiMode = InteractionEnum.GRAB
	else:
		guiMode = InteractionEnum.LOOK
	setButtonTexture()
