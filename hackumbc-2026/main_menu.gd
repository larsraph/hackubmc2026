extends Node2D

var count = 0
@onready var player = $AnimationPlayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("spin_ccw"):
		match count:
			0:
				player.play("shake")
			1:
				player.play("shake")
			2:
				player.play("fall")
				
		count += 1

func start():
	get_tree().change_scene_to_file("res://world2.tscn")
