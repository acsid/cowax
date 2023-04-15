extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move = Vector3.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move.x = 10.0
	move.y = -5
	#var angle = get_floor_angle(Vector3.UP)
	move = move_and_slide_with_snap(move,Vector3.UP)
	#for i in get_slide_count() :
#		var collision = get_slide_collision(i)
	#	global_transform = align_with_y(global_transform, collision.normal)
	if $FrontRay.is_colliding() or $RearRay.is_colliding():
		# If one wheel is in air, move it down
		var nf = $FrontRay.get_collision_normal() if $FrontRay.is_colliding() else Vector3.UP
		var nr = $RearRay.get_collision_normal() if $RearRay.is_colliding() else Vector3.UP
		var n = ((nr + nf) / 2.0).normalized()
		var xform = align_with_y(global_transform, n)
		global_transform = global_transform.interpolate_with(xform, 0.1)


func align_with_y(xform, new_y):
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
	xform.basis = xform.basis.orthonormalized()
	return xform

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$wheel.rotation.z -= 0.1
	$wheelR.rotation.z -= 0.1
