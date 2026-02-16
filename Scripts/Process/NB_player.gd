extends CharacterBody2D

@export var speed: float = 10
@export_category("swings")
@export var swing_cooldown: float = 0.5
@export var swing_dmg: float = 1
@export var swing_animation_player: AnimationPlayer
@export var swing_node: Node2D
var swing_timer = 0

func _process(delta: float) -> void:
	if swing_timer > 0:
		swing_timer -= delta
	elif Input.is_action_pressed("swing"):
		swing_timer = swing_cooldown
		var cursor_global: Vector2 = get_global_mouse_position()
		swing_node.look_at(cursor_global)
		swing_animation_player.play("swing")
		velocity += cursor_global - global_position

func _physics_process(delta: float) -> void:
	var movement: Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	velocity += movement.normalized() * delta * speed
	velocity *= 0.9
	move_and_slide()
