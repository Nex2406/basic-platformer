extends Node

const SPAWN_POSITION := Vector2(100, 100)

var cherry_count: int = 0
var total_cherries: int = 0

func respawn_player(body: Node2D) -> void:
	if not body is CharacterBody2D:
		return
	body.position = SPAWN_POSITION
	body.velocity = Vector2.ZERO
