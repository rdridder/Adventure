extends Node2D

var navigatableScene : NavigatableScene
var compassScene : CompassScene
var navigation : Dictionary
var globalGameState : GlobalGameState

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ready from screen")
	compassScene = %Gui/Compass
	compassScene.setClickCallback(handleNavigation)
	Transitions._set_scene_container(%SceneHolder)
	Transitions.post_transition.connect(initNavigatableScene)
	initGlobalGameState()
	initNavigatableScene()
	EventBus.load_scene_without_animation.connect(loadScreenWithoutAnimation)
	
func _exit_tree() -> void:
	if(Transitions.post_transition.is_connected(initNavigatableScene)):
		Transitions.post_transition.disconnect(initNavigatableScene)

func loadScreenWithoutAnimation(scenePath : String) -> void:
	#TODO fix properly
	globalGameState.hasSeenIntro = true
	var newScene = load(scenePath).instantiate()
	var oldScene = %SceneHolder.get_child(0)
	%SceneHolder.add_child(newScene)
	%SceneHolder.remove_child(oldScene)
	oldScene.queue_free()
	initNavigatableScene()
			
func worldItemsPickedUp(items : Array[InventoryItem]):
	pass
	
func initNavigatableScene() -> void:	
	navigatableScene = %SceneHolder.get_child(0)	
	navigation = navigatableScene.getNavigation()
	compassScene.setDirections(navigation)
	compassScene.setHandlingCLick(false)
	if(!globalGameState.hasSeenIntro):
		%Gui.visible = false
	else:
		%Gui.visible = true
	
# TODO, state needs to be able to set
func initGlobalGameState() -> void:
	globalGameState = GlobalGameState.new()
	
func handleNavigation(direction : String):
	var scenePath : String = navigation[direction]
	var sceneToLoad : PackedScene = load(scenePath)
	var scene : NavigatableScene = sceneToLoad.instantiate()
	Transitions.change_scene_to_instance(scene, Transitions.FadeType.CrossFade, 0.5)
	print("Nav in screen: "+direction)
