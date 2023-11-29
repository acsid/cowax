extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var motion = 1
var movement = Cowax.rng.randi_range(10,35)
var step = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	translation.y += 0.01 * motion
	step += 1
	if step >= movement:
		step = 0
		if motion == -1: 
			motion = 1
		elif motion == 1:
			motion = -1
#	pass
