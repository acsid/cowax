extends VehicleBody


const STEER_SPEED = 1.5
const STEER_LIMIT = 0.4

export var engine_force_value = 700

var throttle = 0

var steer = 0
var steer_target = 0

var speed = 0

var aPilot = true

func _process(delta):
	
	
	if Input.is_action_just_pressed("reset"):
		reset()
	Cowax.millage = translation.distance_to(Vector3.ZERO)
		

func _physics_process(delta):
	var fwd_mps = transform.basis.xform_inv(linear_velocity).x
	#print(fwd_mps)
	autoPilot()
	if aPilot:
		steer_target = steer
	else:
		steer_target = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	
	steer_target *= STEER_LIMIT

	if Input.is_action_pressed("ui_up"):
		# Increase engine force at low speeds to make the initial acceleration faster.
		var speed = linear_velocity.length()
		if speed < 5 and speed != 0:
			engine_force = clamp(engine_force_value * 5 / speed, 0, 100)
		else:
			engine_force = engine_force_value
			Cowax.consumeTHC()
	else:
		engine_force = throttle

	if Input.is_action_pressed("ui_down"):
		# Increase engine force at low speeds to make the initial acceleration faster.
		if fwd_mps >= -1:
			var speed = linear_velocity.length()
			if speed < 5 and speed != 0:
				engine_force = -clamp(engine_force_value * 5 / speed, 0, 100)
			else:
				engine_force = -engine_force_value
		else:
			brake = 1
	else:
		brake = 0.0

	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
	#look_at(get_tree().get_current_scene().get_node("Generator").translation,Vector3.UP)

		
	if $RayCast.is_colliding():
		if $Reset.is_stopped():
			$Reset.start(5)
	else:
		$Reset.stop()


func set_aPilot():
	if aPilot:
		aPilot = false
	else:
		aPilot = true

func reset():
	rotation_degrees.x = 0
	rotation_degrees.y = 0
	rotation_degrees.z = 0
	translation.y = 6


func autoPilot():
	if Input.is_action_just_pressed("autopilot"):
		if aPilot:
			aPilot = false
			throttle = 0
		else:
			throttle = 150
			aPilot = true
		print("AutoPilot: ",aPilot)
	steer = 0
	if $Driver/Left1.is_colliding():
		steer -= 0.5
	if $Driver/Left2.is_colliding():
		steer -= 0.5
	if $Driver/Right1.is_colliding():
		steer += 0.5
	if $Driver/Right2.is_colliding():
		steer += 0.5

func _on_Reset_timeout():
	reset()


func _on_Timer_timeout():
	Cowax.consumeTHC()


func _on_AudioStreamPlayer3D_finished():
	$AudioStreamPlayer3D.play()
