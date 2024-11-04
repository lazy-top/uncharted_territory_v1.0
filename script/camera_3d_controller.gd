extends Camera3D
#鼠标左键按下的状态，false 为并未按下
@onready var mouse_left_press_state=false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_wheel_up"):
		print('-')
	if Input.is_action_just_pressed("mouse_wheel_down"):
		print('-')
	if Input.is_action_just_pressed("mouse_left_press"):
		mouse_left_press_state=true
	if Input.is_action_just_released("mouse_left_press"):
		mouse_left_press_state=false
#    是否按下左键
	if mouse_left_press_state:
		var mouse_postion=get_viewport().get_mouse_position()
#		
	pass
