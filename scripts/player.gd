extends CharacterBody2D

@export var speed = 700
@export var gravity = 60
@export var jump_force = 1300

var animated_sprite
signal player_win
var life = 3
var player_pos_on_next_death = null
var next_respawn : Vector2
var life_label : Label

func _ready():
	animated_sprite = $AnimatedSprite2D
	player_pos_on_next_death == null
	print(player_pos_on_next_death)
	life_label = get_node('/root/Game/Camera2D/Life')
	life_label.text = str(life)

func start(pos):
	position = pos

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 2500:
			velocity.y = 2500
			death()

	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			velocity.y = -jump_force
			$Saut.play()

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
	elif horizontal_direction < 0 and !is_on_floor():
		animated_sprite.flip_h = true
		animated_sprite.play("Jump")
	elif horizontal_direction > 0 and !is_on_floor():
		animated_sprite.flip_h = false
		animated_sprite.play("Jump")
	elif !is_on_floor():
		animated_sprite.play("Jump")
	else:
		animated_sprite.play("Idle")
		
func checkpoint_activated(next_respawn):
	player_pos_on_next_death = next_respawn
	
func death():
	var start_position = get_node('/root/Game/StartPosition').position
	if life > 1:
		if player_pos_on_next_death == null:
			global_position = start_position
		else:
			global_position = player_pos_on_next_death
		life -= 1
		life_label.text = str(life)
	else:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func win():
	player_win.emit()


func _on_dead_line_body_entered(body):
	if body.is_in_group("player"):
		death()
		
