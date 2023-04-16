extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rndmesh()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func rndmesh(path = "res://objects/boat/mesh/"):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file.ends_with(".obj"):
			files.append(file)
	var rndmesh = files[Cowax.rng.randi_range(1,files.size() - 1)]
	var mesh = path + rndmesh
	var mtl = mesh.rstrip("obj") + "mtl"
	print(mtl)
	$CSGMesh.mesh = load(mesh)
	$CSGMesh.material = load(mtl)
