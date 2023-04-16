extends Node

var obj0 = preload("res://objects/blocks/lac/LacPart1.tscn")
var obj1 = preload("res://objects/blocks/bois/bois.tscn")
var road = preload("res://objects/blocks/road/road.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var brush
	Cowax.blocksize = 16
	brush = obj0.instance()
	brush.rotate_y(3.1416)
	if brush.has_method("init"):
		brush.init()
	get_parent().add_child(brush)
	
	brush = obj1.instance()
	if brush.has_method("init"):
		brush.init()
	get_parent().add_child(brush)
	get_parent().add_child(road.instance())
