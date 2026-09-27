extends RigidBody2D

@export var max_rot = 4 * PI
@export var no_friction: Timer
@export var dash_speed: float = 400
@export var coyote: Timer

@export var dash: Array[AudioStreamPlayer2D]

func _physics_process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	var dir = global_position.direction_to(mouse)
	var target_angle = dir.angle()
	var delta_angle = wrapf(target_angle - self.rotation, -PI, PI)
	self.angular_velocity = clamp(delta_angle * (1/delta), -max_rot, max_rot)

func _input(event: InputEvent) -> void:
	if no_friction.is_stopped():
		if get_contact_count() != 0:
			coyote.start()
		if !coyote.is_stopped() and event.is_action_pressed("spin_ccw"):
			var mouse = get_global_mouse_position()
			var dir = global_position.direction_to(mouse)
			self.linear_velocity += dir * dash_speed
			
			var db = randf_range(-2, 2)
			var i = randi_range(0, len(dash) - 1)
			dash[i].volume_db = db
			dash[i].play()
			
			no_friction.start()
			self.physics_material_override.friction = 0
			coyote.stop()


func _on_override_timeout() -> void:
	self.physics_material_override.friction = 200

@export var players: Array[AudioStreamPlayer2D]

func _on_body_entered(_body: Node) -> void:
	var db = randf_range(-10, -8)
	var i = randi_range(0, len(players) - 1)
	players[i].volume_db = db
	players[i].play()
