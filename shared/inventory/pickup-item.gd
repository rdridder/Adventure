@icon("res://classes/icons/key-icon.png")
@tool
extends InventoryItem

const ConstraintManager = preload("res://addons/gloot/core/constraints/constraint_manager.gd")
const IMAGE_NAME : String = "/Root/InventoryImage"
const IMAGE_WORLD_KEY : String = "image-world"

func _ready():
	prototype_id_changed.connect(protoTypeIdChanged)
	if(protoset && !prototype_id.is_empty()):
		updateSprite()

func protoTypeIdChanged() -> void:
	updateSprite()
	update_configuration_warnings()

func _get_configuration_warnings():
	var superMessage : PackedStringArray = super._get_configuration_warnings()
	if(superMessage.is_empty()):
		if !protoset:
			# If the protoset was not set, return
			return superMessage
		# The base class checks returned no errors and a proto set was set
		# Check if all properties are correct
		var prototype: Dictionary = protoset.get_prototype(prototype_id)
		if(!prototype.has(IMAGE_WORLD_KEY)):
			superMessage.append("The proto type needs the image-world property for this plugin to work")
		else:
			var path = prototype[IMAGE_WORLD_KEY]
			if(!ResourceLoader.exists(path)):
				superMessage.append("The path '%s' does not exist, can't load image" % path )	
	return superMessage	
	
	
	
func updateSprite():
	var sprite : Sprite2D = $"InventoryImage"

	var prototype: Dictionary = protoset.get_prototype(prototype_id)
	if(prototype.has(IMAGE_WORLD_KEY)):
		var path = prototype[IMAGE_WORLD_KEY]
		if(ResourceLoader.exists(path)):
			var image = load(path)		
			# TODO check if I need to unload the image
			sprite.texture = null
			sprite.texture = image
			
	
