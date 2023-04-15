extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var obj0 = preload("res://objects/building/default.tscn")
var obj1 = preload("res://objects/building/depaneur/Depanneur.tscn")
var obj2 = preload("res://objects/building/3345/3345.tscn")
var obj3 = preload("res://objects/building/elziggg/elzigg.tscn")
var obj4 = preload("res://objects/blocks/bois/bois.tscn")
var obj5 = preload("res://objects/building/peter/peter.tscn")
var obj6 = preload("res://objects/building/tin/tin.tscn")
var obj7 = preload("res://objects/building/paulsauve/palestre.tscn")
var road = preload("res://objects/blocks/road/road.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var brush
	Cowax.blocksize = 16
	var build = Cowax.rng.randi_range(0,10)
	if build == 0:
		brush = obj1.instance()
		brush.translation.z = -16
	elif build == 1:
		brush = obj2.instance()
		brush.translation.z = -16
	elif build == 2:
		brush = obj3.instance()
	elif build == 3:
		brush = obj4.instance()
	elif build == 4:
		brush = obj5.instance()
	elif build == 5:
		brush = obj6.instance()
		Cowax.blocksize = 32
	elif build == 6:
		brush = obj7.instance()
		Cowax.blocksize = 32
	else:
		brush = obj0.instance()
	if brush.has_method("init"):
		brush.init()
	
	get_parent().add_child(brush)
	if build != 5 or build != 6:
		build = Cowax.rng.randi_range(0,10)
	if build == 0:
		brush = obj1.instance()
		brush.translation.z = 16
	elif build == 1:
		brush = obj2.instance()
		brush.translation.z = 16
	elif build == 2:
		brush = obj3.instance()
	elif build == 3:
		brush = obj4.instance()
	elif build == 4:
		brush = obj5.instance()
	elif build == 5:
		brush = obj6.instance()
		Cowax.blocksize  = 32
	elif build == 6:
		brush = obj7.instance()
		Cowax.blocksize = 32
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
