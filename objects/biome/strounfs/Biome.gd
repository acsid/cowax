extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var obj0 = preload("res://objects/blocks/bois/boistrnf.tscn")
var obj1 = preload("res://objects/blocks/bois/boistrnf.tscn")
var road = preload("res://objects/blocks/road/road.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var brush
	Cowax.blocksize = 16
	var build = Cowax.rng.randi_range(0,1)
	if build == 0:
		brush = obj1.instance()
		brush.translation.z = -16
	else:
		brush = obj0.instance()
	if brush.has_method("init"):
		brush.init()
	
	get_parent().add_child(brush)
	if build != 5:
		build = Cowax.rng.randi_range(0,10)
	if build == 0:
		brush = obj1.instance()
		brush.translation.z = 16
	else:
		brush = obj0.instance()
	brush.rotate_y(3.1416)
	if brush.has_method("init"):
		brush.init()
	get_parent().add_child(brush)
	get_parent().add_child(road.instance())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
