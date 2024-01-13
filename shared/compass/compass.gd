extends CompassScene

	
func _on_n_hover_area_2d_mouse_entered():
	hoverCompass("N", true)


func _on_n_hover_area_2d_mouse_exited():
	hoverCompass("N", false)


func _on_e_hover_area_2d_mouse_entered():
	hoverCompass("E", true)


func _on_e_hover_area_2d_mouse_exited():
	hoverCompass("E", false)


func _on_s_hover_area_2d_mouse_entered():
	hoverCompass("S", true)


func _on_s_hover_area_2d_mouse_exited():
	hoverCompass("S", false)


func _on_w_hover_area_2d_mouse_entered():
	hoverCompass("W", true)


func _on_w_hover_area_2d_mouse_exited():
	hoverCompass("W", false)


func _on_s_hover_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handleMouseClick(viewport, event, shape_idx, "S")


func _on_e_hover_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handleMouseClick(viewport, event, shape_idx, "E")


func _on_n_hover_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handleMouseClick(viewport, event, shape_idx, "N")


func _on_w_hover_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handleMouseClick(viewport, event, shape_idx, "W")
