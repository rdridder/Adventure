extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").modulate.a = 0

func showMessage():
	var player = get_node("AnimationPlayer")
	player.play("fade in")
	await get_tree().create_timer(3).timeout
	player.play("fade out")
	
func setMessage(text):
	var label = get_node("Label")
	label.text = text
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
