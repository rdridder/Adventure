extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_close_inventory_button_pressed():
	%InventoryContainer.visible = false


func _on_chest_button_pressed():
	%InventoryContainer.visible = true
