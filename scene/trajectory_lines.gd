extends Node3D
var data_json_http={
"forklifts": [
{
#id鍙?
"id": "forklift_001",
#//x鐐瑰潗鏍?
"x": 2.5,
#//y鐐瑰潗鏍?
"y": 2.5,
#//褰撳墠鐘舵€?
"status": "active",
#//褰撳墠浠诲姟
"task": "moving materials",
#//褰撳墠閫熷害
"speed": 1.5,
#//褰撳墠杞介噸
"load": 500,
#//鐢垫睜鐢甸噺
"battery": 80,
"timestamp":"2023-10-10T10:30:10Z893",
"forward":"driveing",
"angle": 0.0  # 鏂板鐨勮搴﹀瓧娈碉紝琛ㄧず鍙夎溅鐨勬棆杞搴︼紙浠ュ姬搴︿负鍗曚綅锛?
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
var data_json_local= {
	"forklifts": [
		{
			"id": "forklift_001",
			"trajectory": [
				{"timestamp": "2023-10-01T10:00:00Z", "x": 2.0, "z": 2.0},
				{"timestamp": "2023-10-01T10:01:00Z", "x": 2.5, "z": 2.5},
				{"timestamp": "2023-10-01T10:02:00Z", "x": 3.0, "z": 3.0},
				{"timestamp": "2023-10-01T10:03:00Z", "x": 3.5, "z": 3.5}
			]
		},
		{
			"id": "forklift_002",
			"trajectory": [
				{"timestamp": "2023-10-01T10:00:00Z", "x": 3.0, "z": 3.0},
				{"timestamp": "2023-10-01T10:01:00Z", "x": 3.5, "z": 3.5},
				{"timestamp": "2023-10-01T10:02:00Z", "x": 4.0, "z": 4.0},
				{"timestamp": "2023-10-01T10:03:00Z", "x": 4.5, "z": 4.5}
			]
		}
	]
}

var trajectory_lines = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for forklift in data_json_http.forklifts:
		if(forklift.id=='forklift_001'):
			var line={
				"timestamp":forklift.timestamp,
				"x":forklift.x,
				"z":forklift.z
			}
			trajectory_lines.append(line)
			pass
	pass
func draw_line(lines):
	for i in lines.size():
		print(lines[i])
		pass
	pass
	
