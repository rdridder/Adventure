@icon("res://classes/icons/navigatable-scene.png")
class_name NavigatableScene extends Node2D

@export_group("Compass directions")
@export_file("*.tscn") var north = null
@export_file("*.tscn") var east = null
@export_file("*.tscn") var south = null
@export_file("*.tscn") var west = null
	
	
func getNavigation() -> Dictionary:
	var navigation = {}
	if(isEditorValueSet(north)):
		navigation["N"] = north
	if(isEditorValueSet(east)):
		navigation["E"] = east
	if(isEditorValueSet(south)):
		navigation["S"] = south
	if(isEditorValueSet(west)):
		navigation["W"] = west
	return navigation

# TODO check if below can be done better.
# checking for <null> and "" does not make sense
# Also made editorValue typeless because if set to string a type exception is thrown
func isEditorValueSet(editorValue) -> bool:
	if(editorValue == null || editorValue == "" || editorValue == "<null>"):
		return false
	return true
		
func _on_pickupinventory_item_clicked(selectedItem : InventoryItem) -> void: 
	print("inventory clicked")
	print(selectedItem)
