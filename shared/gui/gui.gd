extends Node2D


func _on_close_inventory_button_pressed():
	%InventoryContainer.visible = false


func _on_chest_button_pressed():
	%InventoryContainer.visible = true
