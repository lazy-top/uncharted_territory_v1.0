extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 添加一个光源确保场景中有照明
	var light = DirectionalLight3D.new()
	light.light_color = Color(1, 1, 1) # 设置为白光
	light.rotation_degrees = Vector3(-45, 0, 0) # 设置角度
	add_child(light)

	# 创建100x100的网格，中心在原点 (0, 0, 0)。

	# 创建地图对象
	var map = MeshInstance3D.new()
	var size = 100
	var half_size = size / 2
	var vertices = PackedVector3Array()
	var indices = PackedInt32Array()

	# 创建水平和垂直线条的顶点。
	for x in range(-half_size, half_size + 1):
		vertices.push_back(Vector3(x, 0, -half_size))
		vertices.push_back(Vector3(x, 0, half_size))
		indices.push_back(vertices.size() - 2)
		indices.push_back(vertices.size() - 1)

	for z in range(-half_size, half_size + 1):
		vertices.push_back(Vector3(-half_size, 0, z))
		vertices.push_back(Vector3(half_size, 0, z))
		indices.push_back(vertices.size() - 2)
		indices.push_back(vertices.size() - 1)

	# 初始化 ArrayMesh。
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_INDEX] = indices

	# 创建网格线。
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, arrays)
	map.mesh = arr_mesh

	# 设置白色材质
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(1, 1, 1) # 白色
	map.set_surface_override_material(0, material)
	add_child(map)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
