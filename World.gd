extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("starting cowax...")
	print("Connecting to obs...")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("1"):
		Obs.set_scene("cbus_side")
		$Spatial/Cbus/Camera.current = true
	if Input.is_action_just_pressed("2"):
		Obs.set_scene("cbu_inside")	
		$Spatial/Cbus/Camera2.current = true
	if Input.is_action_just_pressed("3"):
		Obs.set_scene("cbus_side")	
		$Spatial/Cbus/CamBase/Camera.current = true
	if Input.is_action_just_pressed("4"):
		Obs.set_scene("cbus_side")	
		$Spatial/Cbus/Camera3.current = true
	if Input.is_action_just_pressed("5"):
		Obs.set_scene("cbus_front")	
		$Spatial/Cbus/Camera4.current = true
	if Input.is_action_just_pressed("6"):
		Cowax.addTHC()
		
	pass

func c1(cmd_info : CommandInfo) -> void:
	print("Change camera")
	Obs.set_scene("cbus_side")
	$Spatial/Cbus/Camera.current = true

func c2(cmd_info : CommandInfo) -> void:
	print("change camera")
	Obs.set_scene("cbu_inside")	
	$Spatial/Cbus/Camera2.current = true
	
func c3(cmd_info : CommandInfo) -> void:
	print("change camera")
	Obs.set_scene("cbus_side")	
	$Spatial/Cbus/CamBase/Camera.current = true
	
func c4(cmd_info : CommandInfo) -> void:
	print("change camera")
	Obs.set_scene("cbus_side")	
	$Spatial/Cbus/Camera3.current = true
	
func c5(cmd_info : CommandInfo) -> void:
	print("change camera")
	Obs.set_scene("cbus_front")	
	$Spatial/Cbus/Camera4.current = true

func ap(cmd_info : CommandInfo) -> void:
	$Spatial/Cbus.set_aPilot() 

func thc(cmd_info : CommandInfo) -> void:
	Cowax.gainTHC()
	
func jump(cmd_info : CommandInfo) -> void:
	if Cowax.thc > 100:
		Cowax.thc -= 100
		Cowax.setJC()
		get_tree().get_current_scene().get_node("Generator").newBlock()

func chat_message(data : SenderData, msg : String) -> void:
	get_tree().get_current_scene().get_node("Generator").newBlock(true)
	Cowax.addTHC(msg.length())
	
func train(cmd_info : CommandInfo) -> void:
	if Cowax.thc > 420:
		Cowax.thc -= 420
	get_tree().get_current_scene().get_node("Generator").newBlock(false,true)
