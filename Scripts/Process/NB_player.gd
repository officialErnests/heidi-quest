extends CharacterBody2D

@export var speed: float = 100
@export var label: Label
@export_category("swings")
@export var swing_cooldown: float = 0.5
@export var swing_dmg: float = 1
@export var swing_animation_player: AnimationPlayer
@export var swing_node: Node2D
@export var visual: Sprite2D
@export var swing_area: Area2D
var swing_timer = 0
var timer: float = 0
var slimes_murdered = 0

func _process(delta: float) -> void:
	timer += delta
	visual.flip_h = int(timer * 5) % 2 == 0
	if swing_timer > 0:
		swing_timer -= delta
	elif Input.is_action_pressed("swing"):
		swing_timer = swing_cooldown
		var cursor_global: Vector2 = get_global_mouse_position()
		swing_node.look_at(cursor_global)
		swing_animation_player.play("swing")
		velocity += cursor_global - global_position
		dmg_twice()

func dmg_twice():
	for enemie: NB_enemie in swing_area.get_overlapping_bodies():
			if enemie.dmg(swing_dmg):
				slimes_murdered += 1
				label.text = "INOCENT slimes murdered: " + str(slimes_murdered) + "/100"
				if slimes_murdered > 99:
					get_tree().change_scene_to_file("res://scenes/win.tscn")

func _physics_process(delta: float) -> void:
	var movement: Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	velocity += movement.normalized() * delta * speed
	velocity *= 0.95
	move_and_slide()
