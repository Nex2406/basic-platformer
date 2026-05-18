extends CanvasLayer

@onready var label: Label = $PanelContainer/Label
var total: int = 0

func _ready() -> void:
	total = _count_collectables()
	_refresh()

func _process(_delta: float) -> void:
	_refresh()

func _refresh() -> void:
	label.text = "🍒 %d / %d" % [GameState.cherry_count, total]

func _count_collectables() -> int:
	var root: Node = get_tree().current_scene
	var count: int = 0
	for child in root.get_children():
		if child.name.begins_with("collectable"):
			count += 1
	return count
