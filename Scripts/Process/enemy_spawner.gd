class_name NB_enemie_spawner extends Node2D

@export var player: Node2D
@export var max_enemies: int = 10
@export var enemies_spawn_delay: float = 0.5
@export var packed_enemy: PackedScene
@export var spawn_positions: Array[Node2D]
var enemies_spawn_time: float = 0
var enemies_count: int = 0

func _process(delta: float) -> void:
	if enemies_spawn_time > 0:
		enemies_spawn_time -= delta
	elif enemies_count < max_enemies:
		enemies_spawn_time  = enemies_spawn_delay;
		spawnEnemie()

func enemieDied() -> void:
	enemies_count -= 1

func spawnEnemie() -> void:
	var temp_enemie: NB_enemie = packed_enemy.instantiate()
	enemies_count += 1
	temp_enemie.spawner = self
	temp_enemie.player = player
	temp_enemie.global_position = spawn_positions.pick_random().global_position
	add_child(temp_enemie)
