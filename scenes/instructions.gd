extends CanvasLayer

func _ready() -> void:
	get_tree().paused = true
	$Card/Margin/VBox/StartButton.pressed.connect(_on_start)

func _on_start() -> void:
	get_tree().paused = false
	queue_free()
