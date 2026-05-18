extends AnimatableBody2D

@export var start_offset: Vector2 = Vector2.ZERO
@export var end_offset: Vector2 = Vector2(200, 0)
@export var speed: float = 80.0
@export var pause_duration: float = 0.4

func _ready() -> void:
	var base: Vector2 = position
	var distance: float = (end_offset - start_offset).length()
	var duration: float = distance / maxf(speed, 1.0)
	position = base + start_offset
	var tween := create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops()
	tween.tween_property(self, "position", base + end_offset, duration)
	tween.tween_interval(pause_duration)
	tween.tween_property(self, "position", base + start_offset, duration)
	tween.tween_interval(pause_duration)
