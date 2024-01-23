extends CharacterBody2D

@export var speed = 500
@export var gravity = 60
@export var jump_force = 1250

var animated_sprite

func _ready():
	animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1500:
			velocity.y = 1500

	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			velocity.y = -jump_force

	var horizontal_direction = Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft")
	velocity.x = speed * horizontal_direction

	move_and_slide()

	# Gérer les animations
	if horizontal_direction > 0 and is_on_floor():
		animated_sprite.flip_h = false
		animated_sprite.play("Move")
	elif horizontal_direction < 0 and is_on_floor():
		animated_sprite.flip_h = true
		animated_sprite.play("Move")
	elif !is_on_floor():
		animated_sprite.play("Jump")
	else:
		animated_sprite.play("Idle")
