extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jump = Cowax.jumpchunk()

# Called when the node enters the scene tree for the first time.
func _ready():
	var c = Cowax.rng.randi_range(0,50)
	
	if jump:
		$CollisionShape2.disabled = false
		#$CSGMesh.visible = true
		print("jump generator 20xx")
	elif c != 0:
		$CollisionShape2.disabled = true
		$CSGMesh.visible = false
	else:
		$CollisionShape2.disabled = true
		$CSGMesh.visible = false
		

	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
