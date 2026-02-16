extends Button

@export var exit: bool
@export var scene: PackedScene
@export var fullscreen: bool

func _ready() -> void:
	pressed.connect(thisPressed)

func thisPressed() -> void:
	if (exit): get_tree().quit()
	elif (fullscreen):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		get_tree().change_scene_to_packed(scene)
