extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var loco = preload("res://objects/train/train.tscn")
var wagon = preload("res://objects/train/train2.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#train spawner
	var i = loco.instance()
	i.translate(Vector3(0,3,0))
	add_child(i)
	for s in Cowax.rng.randi_range(1,6):
		var w = wagon.instance()
		var t = s * 35
		t += 35
		w.translate(Vector3(0,3,t))
		add_child(w)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
