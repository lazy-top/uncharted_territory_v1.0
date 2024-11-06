extends Node3D

@onready var agv: Node3D = $"."
var data_json={
"forklifts": [
{
#id号
"id": "forklift_001",
#//x点坐标
"x": 2.5,
#//y点坐标
"y": 2.5,
#//当前状态
"status": "active",
#//当前任务
"task": "moving materials",
#//当前速度
"speed": 1.5,
#//当前载重
"load": 500,
#//电池电量
"battery": 80,
"timestamp":"2023-10-10T10:30:10Z893",
"forward":"driveing",
"angle": 0.0  # 新增的角度字段，表示叉车的旋转角度（以弧度为单位）
},
{
"id": "forklift_002",
"x": 3.5,
"z": 3.5,
"status": "idle",
"task": "waiting for task",
"speed": 0.0,
"load": 0,
"battery": 95,
"timestamp":"2023-10-10T10:30:10Z893",
"forward":"reversing",
"angle": PI  
}
]
}
var global_tween=null
var last_time=null
var forward_state=null
var current_rotation = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween=get_tree().create_tween()
	global_tween=tween
	for forklift in data_json.forklifts:
		if(forklift.id=='forklift_001'):
			position.x=forklift.x
			position.z=forklift.z
			tween.tween_property(agv,'position',Vector3(position.x,0,position.z),0)
			last_time=forklift.timestamp
			forward_state=forklift.forward
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for forklift in data_json.forklifts:
		if(forklift.id=='forklift_001'):
			if forklift.x != position.x or forklift.z != position.z or forklift.angle != current_rotation:
				print("位置或方向更新")
				# 计算新的位置
				var new_position = Vector3(forklift.x, 0, forklift.z)
				# 计算新的旋转角度
				var target_angle = forklift.angle
				# 动画移动到新位置
				var duration = get_interval(last_time, forklift.timestamp)
				global_tween.tween_property(agv, 'position', new_position, duration)
				# 更新旋转角度
				if target_angle != current_rotation:
					global_tween.tween_property(agv, 'rotation', Vector3(0, target_angle, 0), duration)
					current_rotation = target_angle
				last_time =forklift.timestamp
	pass
func get_interval(lastime,nowtime):
	pass
