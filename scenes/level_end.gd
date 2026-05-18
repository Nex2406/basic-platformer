extends Area2D

func _ready() -> void:
	$VictoryLayer.visible = false
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if not body is CharacterBody2D:
		return
	set_deferred("monitoring", false)
	$VictoryLayer/Label.text = "Level Complete!\nCherries collected: %d/%d" % [GameState.cherry_count, GameState.total_cherries]
	$VictoryLayer.visible = true
	get_tree().paused = true
