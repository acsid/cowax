extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var blocksize = 16
onready var biome = Cowax.checkbiome()
var g 
var car = preload("res://objects/car/car.tscn")
var carchunk = false
var trainchunk = false
func init():
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready():
	if biome == 0:
		g = preload("res://objects/biome/rue/Biome.tscn")
	elif biome == 1:
		g = preload("res://objects/biome/forest/Biome.tscn")
	elif biome == 2:
		g = preload("res://objects/biome/strounfs/Biome.tscn")
	elif biome == 3:
		g = preload("res://objects/biome/desert/Biome.tscn")
	elif biome == 4:
		g = preload("res://objects/biome/Lac/Biome.tscn")
	if trainchunk:
		g = preload("res://objects/train/track.tscn")
	var inst = g.instance()
	add_child(inst)
	if carchunk:
		var dir = Cowax.rng.randi_range(0,1)
		if dir == 0:
			var i = car.instance()
			i.global_transform = $CarSpawn.global_transform
			i.rotate_y(-1.15)
			get_tree().get_current_scene().add_child(i)
		else:
			var i = car.instance()
			i.global_transform = $CarSpawn2.global_transform
			i.rotate_y(1.15)
			i.throttle = 50
			i.dir = 1
			get_tree().get_current_scene().add_child(i)
	

	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not get_tree().get_current_scene().get_node_or_null("Spatial"): return
	if global_translation.distance_to(get_tree().get_current_scene().get_node("Spatial").get_node("Cbus").global_translation) > 1000:
		queue_free()


func _on_VisibilityNotifier_screen_exited():
	pass
	#$Timer.start()


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_VisibilityNotifier_screen_entered():
	$Timer.stop()
