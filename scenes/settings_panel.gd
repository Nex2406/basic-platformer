extends CanvasLayer

@onready var gravity_slider: HSlider = $Card/Margin/VBox/Sliders/Gravity/Slider
@onready var jump_slider: HSlider = $Card/Margin/VBox/Sliders/Jump/Slider
@onready var speed_slider: HSlider = $Card/Margin/VBox/Sliders/Speed/Slider
@onready var gravity_value: Label = $Card/Margin/VBox/Sliders/Gravity/Value
@onready var jump_value: Label = $Card/Margin/VBox/Sliders/Jump/Value
@onready var speed_value: Label = $Card/Margin/VBox/Sliders/Speed/Value

func _ready() -> void:
	visible = false
	gravity_slider.value = Settings.gravity
	jump_slider.value = Settings.jump_velocity
	speed_slider.value = Settings.speed
	gravity_slider.value_changed.connect(_on_gravity_changed)
	jump_slider.value_changed.connect(_on_jump_changed)
	speed_slider.value_changed.connect(_on_speed_changed)
	$Card/Margin/VBox/Buttons/Reset.pressed.connect(_on_reset)
	$Card/Margin/VBox/Buttons/Close.pressed.connect(_toggle)
	_on_gravity_changed(gravity_slider.value)
	_on_jump_changed(jump_slider.value)
	_on_speed_changed(speed_slider.value)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_toggle()
		get_viewport().set_input_as_handled()

func _toggle() -> void:
	visible = not visible
	get_tree().paused = visible

func _on_gravity_changed(v: float) -> void:
	Settings.gravity = v
	gravity_value.text = "%.1f m/s²" % (v / 100.0)

func _on_jump_changed(v: float) -> void:
	Settings.jump_velocity = v
	jump_value.text = "%d" % int(v)

func _on_speed_changed(v: float) -> void:
	Settings.speed = v
	speed_value.text = "%d" % int(v)

func _on_reset() -> void:
	gravity_slider.value = 980.0
	jump_slider.value = -900.0
	speed_slider.value = 400.0
