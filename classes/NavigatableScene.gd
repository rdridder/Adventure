@icon("res://classes/icons/navigatable-scene.png")
class_name NavigatableScene extends Node2D

@export_group("Compass directions")
@export_file var north
@export_file var east
@export_file var south
@export_file var west
	
func getNavigation() -> Dictionary:
	var navigation = {}
	if(north != null):
		navigation["N"] = north
	if(east != null):
		navigation["E"] = east
	if(south != null):
		navigation["S"] = south
	if(west != null):
		navigation["W"] = west
	return navigation
