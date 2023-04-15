extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	translation.z -= 1
	if translation.z <= -200:
		translation.z = 200
	linear_velocity = Vector3.ZERO


func _on_Area_body_entered(body):
	body.translation.y = 264

