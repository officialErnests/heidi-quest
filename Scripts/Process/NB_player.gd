extends CharacterBody2D

@export var speed: float = 10

func _physics_process(delta: float) -> void:
	var movement: Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	velocity += movement.normalized() * delta * speed
	velocity *= 0.9
	move_and_slide()
