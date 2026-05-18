extends Area2D

func _ready() -> void:
	GameState.total_cherries += 1
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if not body is CharacterBody2D:
		return
	set_deferred("monitoring", false)
	GameState.cherry_count += 1
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector2.ZERO, 0.15)
	tween.tween_callback(queue_free)
