extends Node2D

var navigatableScene : NavigatableScene
var compassScene : CompassScene
var navigation : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ready from screen")
	compassScene = %Gui/Compass
	compassScene.setClickCallback(handleNavigation)
	Transitions._set_scene_container(%SceneHolder)
	Transitions.post_transition.connect(initNavigatableScene)
	initNavigatableScene()
	
func initNavigatableScene() -> void:
	navigatableScene = %SceneHolder.get_child(0)	
	navigation = navigatableScene.getNavigation()
	compassScene.setDirections(navigation)
	compassScene.setHandlingCLick(false)
		
	
func handleNavigation(direction : String):
	var scenePath : String = navigation[direction]
	var sceneToLoad : PackedScene = load(scenePath)
	var scene : NavigatableScene = sceneToLoad.instantiate()
	Transitions.change_scene_to_instance(scene, Transitions.FadeType.CrossFade, 0.5)
	print("Nav in screen: "+direction)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
