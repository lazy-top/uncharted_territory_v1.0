extends Node3D
var data_json_http={
"forklifts": [
{
#id閸?
"id": "forklift_001",
#//x閻愮懓娼楅弽?
"x": 2.5,
#//y閻愮懓娼楅弽?
"z": 2.5,
#//瑜版挸澧犻悩鑸碘偓?
"status": "active",
#//瑜版挸澧犳禒璇插
"task": "moving materials",
#//瑜版挸澧犻柅鐔峰
"speed": 1.5,
#//瑜版挸澧犳潪浠嬪櫢
"load": 500,
#//閻㈠灚鐫滈悽鐢稿櫤
"battery": 80,
"timestamp":"2023-10-10T10:30:10Z893",
"forward":"driveing",
"angle": 0.0  # 閺傛澘顤冮惃鍕潡鎼达箑鐡у▓纰夌礉鐞涖劎銇氶崣澶庢簠閻ㄥ嫭妫嗘潪顒冾潡鎼达讣绱欐禒銉ュК鎼达缚璐熼崡鏇氱秴閿?
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
var last_time=null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for forklift in data_json_http.forklifts:
		if(forklift.id=='forklift_001'):
			if(last_time!=forklift.timestamp):
				var line={
					"timestamp":forklift.timestamp,
					"x":forklift.x,
					"z":forklift.z,
				}
				trajectory_lines.append(line)
				last_time=forklift.timestamp
				pass
	pass
func draw_line(lines):
	for i in lines.size():
		print(lines[i])
		pass
	pass
	
