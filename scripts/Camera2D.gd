extends Camera2D

var player : CharacterBody2D

func _ready():
 
	player = get_node("/root/Game/Player")

func _process(delta):
	if player:
		position.x = player.global_position.x
