class_name NB_enemie extends RigidBody2D

@export var spawner: NB_enemie_spawner
@export var player: Node2D
@export var hp: float = 3
@export var hop_time: float = 1
@export var hop_speed: float = 40
@export var enemie_sprite: Sprite2D

var hop_timer: float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hop_timer > 0:
		hop_timer -= delta
	else:
		hop_timer = hop_time
		linear_velocity += (player.global_position - global_position).normalized() * hop_speed
		enemie_sprite.flip_h = linear_velocity.x < 0

func dmg(dmg: float) -> bool:
	hp -= dmg
	if hp > 0: return false
	else:
		spawner.enemieDied()
		queue_free()
		return true
