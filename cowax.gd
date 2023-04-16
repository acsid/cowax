extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pass # Replace with function body.


var blocksize = 16 

var biomelen = 25
var biome = 0
var millage = 1700000

func get_miles():
	var ret = millage/16/100
	return stepify(ret,0.1)

func checkbiome():
	
	biomelen -= 1
	if biomelen == 0:
		biomelen = 25
		biome = rng.randi_range(0,4)
		if biome == 3:
			biomelen = 75
		return biome
	else:
		return biome
# Called every frame. 'delta' is the elapsed time since the previous frame.

var thc = 420
func consumeTHC():
	thc -= 1

func gainTHC():
	thc += rng.randi_range(10,42)
	
func addTHC(th = 1):
	thc += th

var jc = false

func setJC():
	jc = true

func jumpchunk():
	if jc: 
		jc = false
		return true
	else:
		return false
		


