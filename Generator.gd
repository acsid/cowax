extends Spatial

onready var block = preload("res://Block.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var distance = 0
var chunkSize = 16
var b = 0
var biome = 0
var biomeLength = 0
var inst = null
var last_inst = inst
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func newBlock(carchunk = false, train = false):
	var inst = block.instance()
	var bs = inst.init()
	translation.x += Cowax.blocksize
	inst.translation.x = translation.x
	inst.biome = biome
	inst.carchunk = carchunk
	inst.trainchunk = train
	get_tree().get_current_scene().add_child(inst)
	distance += 1
	biomeLength += 1

func switchBiome():
	biomeLength = 0

func _process(delta):
	if b < chunkSize:
		newBlock()
		b += 1

func newChunk():
	b = 0

func _on_Area_body_entered(body):
	if body.is_in_group("cbus"):
		newChunk()
	#print("Generator Triggered")
