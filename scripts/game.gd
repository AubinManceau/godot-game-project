extends Node2D

func _ready():
	new_game()
	$Dimension2.hide()
	
func _process(delta):
	if Input.is_action_just_pressed("Switch"):
		if $Dimension1.is_visible():
			$Dimension1.hide()
			$Dimension2.show()
		elif $Dimension2.is_visible():
			$Dimension2.hide()
			$Dimension1.show()

func new_game():
	$Player.start($StartPosition.position)

func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
func on_win():
	get_tree().change_scene_to_file("res://scenes/victory.tscn")
