extends Node3D
var map_json={
	"map": {
"grid_size": "1x1",
"areas": [
{
"type": "forbidden",
"coordinates": [[0, 0], [0, 10], [10, 0], [10, 10]],
"color": "red"
},
{
"type": "accessible",
"coordinates": [[20, 20], [20, 30], [30, 20], [30, 30]],
"color": "green"
}
]}
	}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	添加光源
	var light = DirectionalLight3D.new()
	light.light_color = Color(1, 1, 1) 
	light.rotation_degrees = Vector3(-45, 0, 0) 
	add_child(light)

	var data=map_json.map.areas
	for area in data:
		print(area)
		_create_area(area)


func _create_area(area):
	var material = StandardMaterial3D.new()
	if area["color"]=='red':
			material.albedo_color = Color.RED
	else:
		material.albedo_color = Color.GREEN
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = _create_mesh(area["coordinates"])
	mesh_instance.material_override = material
	add_child(mesh_instance)


func _create_mesh(coordinates):
	var vertices = PackedVector3Array()
	var indices = PackedInt32Array()
		# 解析 coordinates 并添加顶点
	for coord in coordinates:
		vertices.append(Vector3(coord[0], 0, coord[1]))

	# 定义两个三角形来构成正方形
	indices.append(0)  # 左下角
	indices.append(1)  # 右下角
	indices.append(2)  # 右上角
	indices.append(0)  # 左下角
	indices.append(2)  # 右上角
	indices.append(3)  # 左上角

	var array = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_INDEX] = indices
	# 创建 Mesh。
	array.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	return array
