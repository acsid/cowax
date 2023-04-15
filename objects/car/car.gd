extends VehicleBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const STEER_SPEED = 1.5
const STEER_LIMIT = 0.4

export var engine_force_value = 100

var throttle = 100

var steer = 0
var steer_target = 0
var dir = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	rndmesh()
	$CSGMesh.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_translation.distance_to(get_tree().get_current_scene().get_node("Spatial").get_node("Cbus").global_translation) > 1000:
		queue_free()

func _physics_process(delta):
	#var fwd_mps = transform.basis.xform_inv(linear_velocity).x
	#print(fwd_mps)
	steer = 0
	if dir == 0:
		if $Driver/Left1.is_colliding():
			steer -= 0.5
		if $Driver/Left2.is_colliding():
			steer -= 0.5
		if $Driver/Right1.is_colliding():
			steer += 0.5
		if $Driver/Right2.is_colliding():
			steer += 0.5
	else:
		if $Driver2/Left1.is_colliding():
			steer -= 0.5
		if $Driver2/Left2.is_colliding():
			steer -= 0.5
		if $Driver2/Right1.is_colliding():
			steer += 0.5
		if $Driver2/Right2.is_colliding():
			steer += 0.5
	steer_target = steer
	#print(rotation.y)
	steer_target *= STEER_LIMIT
	engine_force = throttle
	#move_and_slide(Vector3(1,0,0),Vector3.UP,false)
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)


func rndmesh(path = "res://objects/car/mesh/"):
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
	


func _on_AudioStreamPlayer3D_finished():
	$AudioStreamPlayer3D.play()
