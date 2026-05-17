extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body: Node2D) -> void:
	monitoring = false
	GameState.cherry_count += 1
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector2.ZERO, 0.15)
	tween.tween_callback(queue_free)
