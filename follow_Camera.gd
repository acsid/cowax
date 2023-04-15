extends Camera


export var min_distance = 1.0
export var max_distance = 5.0
export var angle_v_adjust = -10.0

export var height = 1.5
var collision_exception = []

var currentvision = 1

func get_input():
	if Input.is_action_just_pressed("cam1"):
		currentvision = 0
		angle_v_adjust = 0.0
		min_distance = 10.0
		max_distance = 15.0
	if Input.is_action_just_pressed("cam2"):
		currentvision = 1
		angle_v_adjust = -10.0
		min_distance = 1.0
		max_distance = 5.0

func _ready():
	# Find collision exceptions for ray.
	var node = self
	while(node):
		if (node is RigidBody):
			collision_exception.append(node.get_rid())
			break
		else:
			node = node.get_parent()

	# This detaches the camera transform from the parent spatial node.
	set_as_toplevel(true)


func _physics_process(_delta):
	get_input()
	var target = get_parent().get_global_transform().origin
	var pos = get_global_transform().origin

	var from_target = pos - target

	# Check ranges.
	if from_target.length() < min_distance:
		from_target = from_target.normalized() * min_distance
	elif from_target.length() > max_distance:
		from_target = from_target.normalized() * max_distance

	from_target.y = height

	pos = target + from_target

	look_at_from_position(pos, target, Vector3.UP)

	# Turn a little up or down
	var t = get_transform()

	t.basis = Basis(t.basis[currentvision].normalized(), deg2rad(angle_v_adjust)) * t.basis
	#print(t)

	set_transform(t)
	if currentvision == 1:
		translation.z -= 16

