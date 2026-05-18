extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _physics_process(delta):
	#Animations
	if abs(velocity.x)>1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	# Gravity
	if not is_on_floor():
		velocity.y += Settings.gravity * delta
		sprite_2d.animation = "jumping"

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = Settings.jump_velocity


	# Movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * Settings.speed
	else:
		velocity.x = move_toward(velocity.x, 0, Settings.speed)

	move_and_slide()

	# Flip sprite
	if sprite_2d:
		sprite_2d.flip_h = velocity.x < 0
