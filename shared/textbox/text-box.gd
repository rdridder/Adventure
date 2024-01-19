extends Node2D

func _ready() -> void:
	hideTextBox()
	EventBus.show_text_box_world_overlay.connect(showTextBox)

func showTextBox(text : String) -> void:
	%RichTextLabel.visible = true
	%RichTextLabel.text = text

func hideTextBox() -> void:
	visible = false


func _on_button_pressed():
	hideTextBox()
