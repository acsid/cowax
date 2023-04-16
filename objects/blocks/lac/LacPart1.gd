extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var obj0 = preload("res://objects/boat/boat.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if Cowax.rng.randi_range(0,10) == 0:
		var inst = obj0.instance()
		$CSGMesh.add_child(inst)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
