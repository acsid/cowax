extends Spatial

var cactus = preload("res://objects/Bandesert/Cactus.tscn")
var chamo = preload("res://objects/Bandesert/chamo.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var objs = Cowax.rng.randi_range(1,20)
var obj = 0

func _ready():
	var objs = Cowax.rng.randi_range(1,20)

	for i in objs:
		var type = Cowax.rng.randi_range(0,1)
		if type == 0:
			var stype = Cowax.rng.randi_range(0,25)
			var inst = cactus.instance()
			if stype == 0:
				inst = chamo.instance()
			var pos = Vector3(Cowax.rng.randi_range(-8,8),0,Cowax.rng.randi_range(-64,64))
			inst.translation = pos
			$CSGMesh.add_child(inst)
		if type == 1:
			var inst = cactus.instance()
			var pos = Vector3(Cowax.rng.randi_range(-8,8),0,Cowax.rng.randi_range(-64,64))
			inst.translation = pos
			$CSGMesh.add_child(inst)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if objs < obj:
		obj += 1
		var type = Cowax.rng.randi_range(0,1)
		if type == 0:
			var stype = Cowax.rng.randi_range(0,25)
			var inst = cactus.instance()
			if stype == 0:
				inst = chamo.instance()
				var pos = Vector3(Cowax.rng.randi_range(-8,8),0,Cowax.rng.randi_range(-64,64))
				inst.translation = pos
				$CSGMesh.add_child(inst)
		if type == 1:
			var inst = cactus.instance()
			var pos = Vector3(Cowax.rng.randi_range(-8,8),0,Cowax.rng.randi_range(-64,64))
			inst.translation = pos
			$CSGMesh.add_child(inst)
