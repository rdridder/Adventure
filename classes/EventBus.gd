@icon("res://classes/icons/compass.png")
extends Node

signal inventory_items_taken_from_world(inventoryItems : Array[InventoryItem])

signal show_text_box_world_overlay(text : String)

signal interaction_triggered(interactionId : String, interactionType : int)

signal load_scene_without_animation(scenePath : String)
