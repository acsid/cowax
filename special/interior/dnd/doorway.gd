extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var door_open = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("1") : 
		door_open = 1
	if Input.is_action_just_pressed("2") : 
		door_open = 0
	if door_open == 1:
		$Sprite3D2.visible = false
		$Sprite3D3.visible = true
	if door_open == 0:
		$Sprite3D2.visible = true
		$Sprite3D3.visible = false
		
#	pass
