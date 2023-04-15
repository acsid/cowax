extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var gg = Cowax.rng.randi_range(0,10)
	if gg == 0:
		$Sprite3D2.texture = load("res://objects/building/elziggg/Moi01.png")
	elif gg == 1:
		$Sprite3D2.texture = load("res://objects/building/elziggg/Moi02.png")
	elif gg == 2:
		$Sprite3D2.texture = load("res://objects/building/elziggg/Moi03.png")
	elif gg == 3:
		$Sprite3D2.texture = load("res://objects/building/elziggg/Moi04.png")
	else:
		$Sprite3D2.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
