extends Camera3D



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_wheel_up"):
		print('-')
	pass
