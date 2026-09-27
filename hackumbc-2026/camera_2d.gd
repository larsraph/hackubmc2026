extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(input: InputEvent):
	if input.is_action_pressed("ui_right"):
		self.position.x += 20
	if input.is_action_pressed("ui_down"):
		self.position.y -= 20
	if input.is_action_pressed("ui_up"):
		self.position.y += 20
	if input.is_action_pressed("ui_left"):
		self.position.x -= 20
