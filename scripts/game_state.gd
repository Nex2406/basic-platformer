extends Node

const SPAWN_POSITION := Vector2(100, 100)

var cherry_count: int = 0

func respawn_player(body: Node2D) -> void:
	body.position = SPAWN_POSITION
	if "velocity" in body:
		body.velocity = Vector2.ZERO
