extends Camera2D

var player : CharacterBody2D
var dimension1 : Node2D
var dimension2 : Node2D
var start1 : StaticBody2D
var end1 : StaticBody2D
var start2 : StaticBody2D
var end2 : StaticBody2D

func _ready():
	start1 = get_node("/root/Game/Dimension1/Start1")
	end1 = get_node("/root/Game/Dimension1/End1")
	start2 = get_node("/root/Game/Dimension2/Start2")
	end2 = get_node("/root/Game/Dimension2/End2")
	player = get_node("/root/Game/Player")
	dimension1 = get_node("/root/Game/Dimension1")
	dimension2 = get_node("/root/Game/Dimension2")

func _process(delta):
	if player:
		if dimension1:
			var min1_x = start1.global_position.x + get_viewport_rect().size.x / 2.0
			var max1_x = end1.global_position.x - get_viewport_rect().size.x / 2.0
			
			var new_x = clamp(player.global_position.x, min1_x, max1_x)
			position.x = new_x
		
		if dimension2:
			var min2_x = start2.global_position.x + get_viewport_rect().size.x / 2.0
			var max2_x = end2.global_position.x - get_viewport_rect().size.x / 2.0
			
			var new_x_2 = clamp(player.global_position.x, min2_x, max2_x)
			position.x = new_x_2
