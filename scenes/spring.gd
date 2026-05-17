extends Area2D

@export var launch_force: float = -1500.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if "velocity" in body:
		body.velocity.y = launch_force
