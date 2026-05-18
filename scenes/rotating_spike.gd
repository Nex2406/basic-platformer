extends Node2D

@export var angular_velocity: float = 2.0

func _ready() -> void:
	$Area2D.body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	rotation += angular_velocity * delta

func _on_body_entered(body: Node2D) -> void:
	GameState.respawn_player(body)
