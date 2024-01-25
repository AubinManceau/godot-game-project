extends Area2D

var checkpoint_position : Vector2
var next_respawn : Vector2
var player : CharacterBody2D = null

func _ready():
	player = get_node("/root/Game/Player")
	if player:
		checkpoint_position = global_position

func _on_body_entered(body):
	if body.is_in_group("player") and player:
		next_respawn = checkpoint_position
		player.checkpoint_activated(next_respawn)
		
