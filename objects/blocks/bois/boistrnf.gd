extends Spatial

var strounf = preload("res://objects/blocks/bois/strnf.tscn")
var arbre = preload("res://objects/blocks/bois/arbe.tscn")
var buisson = preload("res://objects/blocks/bois/Bush.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var objs = Cowax.rng.randi_range(1,20)

	for i in objs:
		var type = Cowax.rng.randi_range(0,5)
		if type == 0:
			var inst = strounf.instance()
			var pos = Vector3(Cowax.rng.randi_range(-8,8),0,Cowax.rng.randi_range(-64,64))
			inst.translation = pos
			inst.translate(Vector3(0,6,0))
			$CSGMesh.add_child(inst)
		elif type == 1:
			var inst = arbre.instance()
			var pos = Vector3(Cowax.rng.randi_range(-8,8),0,Cowax.rng.randi_range(-64,64))
			inst.translation = pos
			$CSGMesh.add_child(inst)
		elif type == 2:
			var inst = buisson.instance()
			var pos = Vector3(Cowax.rng.randi_range(-8,8),0,Cowax.rng.randi_range(-64,64))
			inst.translation = pos
			$CSGMesh.add_child(inst)
		else:
			var inst = arbre.instance()
			var pos = Vector3(Cowax.rng.randi_range(-8,8),0,Cowax.rng.randi_range(-64,64))
			inst.translation = pos
			$CSGMesh.add_child(inst)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
