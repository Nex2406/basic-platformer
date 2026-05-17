extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
const GRAVITY = 980.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _physics_process(delta):
	#Animations
	if abs(velocity.x)>1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		sprite_2d.animation = "jumping"

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Flip sprite
	if sprite_2d:
		sprite_2d.flip_h = velocity.x < 0
