extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	var compass = get_node("Compass")
	compass.disable("E")
	compass.disable("W")
	compass.set_scene("N", "res://screens/forest-path/forest-path.tscn")	
	compass.set_scene("S", "res://screens/forest/forest.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
