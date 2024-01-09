extends Node2D

var scenes = {}

func set_scene(direction, scene):
	scenes[direction] = scene;
	
	if direction == "N":
		get_node("Mouseover "+direction).set_click_callback(change_scene_n)
	elif direction == "E":
		get_node("Mouseover "+direction).set_click_callback(change_scene_e)
	elif direction == "S":
		get_node("Mouseover "+direction).set_click_callback(change_scene_s)
	elif direction == "W":
		get_node("Mouseover "+direction).set_click_callback(change_scene_w)

func disable(direction):
	get_node("Mouseover "+direction).visible = false
	get_node(direction).visible = true
	
func enable(direction):
	get_node("Mouseover "+direction).visible = true
	get_node(direction).visible = false

func change_scene(direction):
	if(scenes.has(direction)):
		print(scenes[direction])
		get_tree().change_scene_to_file(scenes[direction])
		
func change_scene_n():
	change_scene("N")
	
func change_scene_e():
	change_scene("E")
	
func change_scene_s():
	change_scene("S")
	
func change_scene_w():
	change_scene("W")
