extends Node2D

var dimension1_scene = preload("res://scenes/dimension_1.tscn")
var dimension2_scene = preload("res://scenes/dimension_2.tscn")

var dimension1_instance = null
var dimension2_instance = null

var isDimension1Active = true

func _ready():
	new_game()
	dimension1_instance = dimension1_scene.instantiate()
	add_child(dimension1_instance)

func _process(delta):
	if Input.is_action_just_pressed("Switch"):
		if isDimension1Active:
			dimension1_instance.queue_free()
			dimension2_instance = dimension2_scene.instantiate()
			add_child(dimension2_instance)
			isDimension1Active = false
		else:
			dimension2_instance.queue_free()
			dimension1_instance = dimension1_scene.instantiate()
			add_child(dimension1_instance)
			isDimension1Active = true

func new_game():
	$Player.start($StartPosition.position)
