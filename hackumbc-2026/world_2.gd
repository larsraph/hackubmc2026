extends Node2D

var correct: bool = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	correct = true
	# Hide player
	$Sword.hide()
	$Sword.process_mode = Node.PROCESS_MODE_DISABLED
	# Play death animaiton	
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play("default")
	$Dragon.play("death")
	$AudioStreamPlayer2D.stop()
	$DeathNoise.play(.12)
	
	await get_tree().create_timer(.6).timeout
	$RigidBody2D.disable_mode = Node.PROCESS_MODE_ALWAYS
	$RigidBody2D.visible = true
	$RigidBody2D.angular_velocity = 5

func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.visible = false


func _on_dragon_animation_finished() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
