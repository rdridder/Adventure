@tool
extends Node2D

const IMAGE_WORLD_KEY : String = "image-world"

var firstInventoryItem : InventoryItem = null

func _ready() -> void:
	$"Inventory".contents_changed.connect(contentsChanged)
	setInventoryItem()
	setImage()

func _exit_tree() -> void:
	if($"Inventory".contents_changed.is_connected(contentsChanged)):
		$"Inventory".contents_changed.disconnect(contentsChanged)

func _get_configuration_warnings() -> PackedStringArray:
	if firstInventoryItem == null:
		return PackedStringArray([
				"Please add at least one item to this inventory " \
				+ "The first item image will be shown in the world. " \
				+ "When clicking the item all contents in the inventory " \
				+ "will be transferred to your local inventory."])
	return PackedStringArray()

func contentsChanged() -> void:
	setInventoryItem()
	setImage()
	update_configuration_warnings()

func setInventoryItem() -> void:
	var inventoryNode:  Inventory = $"Inventory";
	var items : Array[InventoryItem] = inventoryNode.get_items()
	if(items && !items.is_empty()):
		firstInventoryItem = items[0]
	else:
		firstInventoryItem = null

func setImage() -> void:
	var sprite : Sprite2D =  $"WorldImage"
	sprite.texture = null
	if(firstInventoryItem):
		var path : String = firstInventoryItem.get_property(IMAGE_WORLD_KEY)
		print(path)
		if(ResourceLoader.exists(path)):
			var image : Resource = load(path)
			# TODO check if I need to unload the image
			sprite.texture = image
		
func _on_area_2d_input_event(viewport, event, shape_idx) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("emitting item clicked")
		var items : Array[InventoryItem] = $"Inventory".get_items()
		EventBus.inventory_items_taken_from_world.emit(items)
