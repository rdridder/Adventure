extends Node2D

func _ready() -> void:
	%TextBoxContainer.visible = false
	EventBus.show_text_box_world_overlay.connect(showTextBox)

func showTextBox(text : String) -> void:
	print("show text box")
	%RichTextLabel.text = text
	$"AnimationPlayer".play("fade in")

func hideTextBox() -> void:
	print("hide text box")
	$"AnimationPlayer".play("fade out")

func _on_button_pressed():
	hideTextBox()
