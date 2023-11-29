extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/VBoxContainer/HBoxContainer/ProgressBar.value = Cowax.thc
	$Panel/VBoxContainer/HBoxContainer/Label2.text = String(Cowax.thc)
	$Panel/VBoxContainer/HBoxContainer2/Label2.text = String(Cowax.get_miles())
	$Panel/VBoxContainer/HBoxContainer3/Label2.text = String(Cowax.speed)
#	pass
