extends Area2D

var checkpoint_position : Vector2
var next_respawn : Vector2
var player : CharacterBody2D = null
var animation : AnimatedSprite2D

func _ready():
	player = get_node("/root/Game/Player")
	animation = $Animation
	animation.hide()

func _on_body_entered(body):
	if body.is_in_group("player") and player:
		next_respawn = global_position
		player.checkpoint_activated(next_respawn)
		animation.show()
		animation.play('activated')
		
func  hide_animation():
	animation.hide()
