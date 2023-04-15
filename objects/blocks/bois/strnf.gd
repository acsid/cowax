extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dir = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var type = Cowax.rng.randi_range(0,4)
	if type == 1:
		texture = preload("res://objects/blocks/bois/bandistrounffe.png")
	if type == 2:
		texture = preload("res://objects/blocks/bois/GGstrounf2.png")
	if type == 3:
		texture = preload("res://objects/blocks/bois/PasStrounffe.png")
	if type == 4:
		texture = preload("res://objects/blocks/bois/strounffeviking.png")
	
	$Timer.start(Cowax.rng.randf_range(0.5,5))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#translate(Vector3(dir,0,0))
	pass


func _on_Timer_timeout():
	#print("sss" , dir)
	if dir == 1:
		dir = -1
		rotate_y(3.14)
	else:
		dir = 1
		rotate_y(3.14)

	pass # Replace with function body.
