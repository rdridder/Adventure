extends Node2D

func _ready():
	EventBus.inventory_items_taken_from_world.connect(pickupWorldItems)

func _exit_tree() -> void:
	if(EventBus.inventory_items_taken_from_world.is_connected(pickupWorldItems)):
		EventBus.inventory_items_taken_from_world.disconnect(pickupWorldItems)

func pickupWorldItems(items : Array[InventoryItem]) -> void:
	print("pickup world items")
	for item: InventoryItem in items:
		item._inventory.transfer(item, $"InventoryGrid")

func _on_close_inventory_button_pressed():
	%InventoryContainer.visible = false


func _on_chest_button_pressed():
	%InventoryContainer.visible = true
