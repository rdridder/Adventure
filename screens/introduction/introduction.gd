extends NavigatableScene

var introStep : int = 0

func _ready():
	introStep = 0
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	%AnimationPlayer.play("fade in slow")

func _on_fade_in_animation_animation_finished(anim_name):
	introStep+=1
	if(introStep == 1):
		Dialogic.start('introduction')
	elif(introStep == 3):	
		%Background.texture = load("res://screens/forest/assets/9ec31c36-79b8-4a4a-9328-622f1d67471f.webp")
		%AnimationPlayer.play_backwards("fade out fast")
	elif(introStep == 4):
		%AnimationPlayer.play("glowing skull")
		%"Glowing-skull".visible = true;
	elif(introStep == 5):
		Dialogic.start('introduction2')	
	print(introStep)		

func _on_timeline_ended():
	introStep+=1
	if(introStep == 2):
		%AnimationPlayer.play("fade out fast")
	if(introStep == 6):
		EventBus.load_scene_without_animation.emit("res://screens/forest/forest.tscn")
	print(introStep)
