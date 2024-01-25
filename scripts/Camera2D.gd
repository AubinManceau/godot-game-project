extends Camera2D

var player : CharacterBody2D

func _ready():
	player = get_node("/root/Game/Player")

func _process(delta):
	var start : float = 0
	var end : float = 24950
	if player:
			var min_x = start + get_viewport_rect().size.x / 2.0
			var max_x = end - get_viewport_rect().size.x / 2.0
			
			var new_x = clamp(player.global_position.x, min_x, max_x)
			position.x = new_x
