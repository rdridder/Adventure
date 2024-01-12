extends Node2D

@onready var btnEquip: Button = $Equip
@onready var btnUnequip: Button = $UnEquip
@onready var slot: ItemSlot = $ItemSlot
@onready var ctrlInventory: CtrlInventory = $CtrlInventory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_equip_pressed():
	var item: InventoryItem = ctrlInventory.get_selected_inventory_item()
	if item == null:
		return

	slot.item = item


func _on_un_equip_pressed():
	slot.item = null


func _on_close_pressed():
	ctrlInventory.visible = false
