extends Position3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var last_pos = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_viewport().get_camera().unproject_position(self.global_translation)
	var rot = get_parent().rotation_degrees
	
	#get_viewport().get_node(name).global_translation
	if pos.x != last_pos.x:
		last_pos = pos
		#print(pos)
		if Obs.connected:
			if get_viewport().get_camera().name == "Camera":
				if name == "cam1":
					#Obs.set_sourceTransform("cbus_side",4,pos.x,pos.y,rot.z)
					pass
				elif name == "Camera_logi":
					Obs.set_sourceTransform("depanneur",5,pos.x,pos.y,rot.z)
				elif name == "corp1":
					Obs.set_sourceTransform("cbus_side",7,pos.x,pos.y,rot.z)
				elif name == "corp2":
					Obs.set_sourceTransform("cbus_side",8,pos.x,pos.y,rot.z)
				elif name == "Flag":
					Obs.set_sourceTransform("cbus_side",23,pos.x,pos.y,rot.z)
				elif name == "discord":
					Obs.set_sourceTransform("cbus_side",6,pos.x,pos.y,rot.z)
					pass
				elif name == "discord2":
					#Obs.set_sourceTransform("cbus_side",9,pos.x,pos.y,rot.z)
					pass
			if get_viewport().get_camera().name == "Camera3":
				if name == "cam1":
					#Obs.set_sourceTransform("cbus_side",4,pos.x,pos.y,rot.z)
					pass
				elif name == "Camera_logi":
					Obs.set_sourceTransform("cbus_side",7,pos.x,pos.y,rot.z)
				elif name == "corp2":
					Obs.set_sourceTransform("cbus_side",8,pos.x,pos.y,rot.z)
				elif name == "corp1":
					Obs.set_sourceTransform("cbus_side",7,pos.x,pos.y,rot.z)
				elif name == "Flag":
					Obs.set_sourceTransform("cbus_side",23,pos.x,pos.y,rot.z)
				#elif name == "corp3":
			#		Obs.set_sourceTransform("cbus_side",9,pos.x,pos.y,rot.z)
				#elif name == "corp4":
			#		Obs.set_sourceTransform("cbus_side",10,pos.x,pos.y,rot.z)
				#elif name == "crop5":
			#		Obs.set_sourceTransform("cbus_side",11,pos.x,pos.y,rot.z)
			#	elif name == "discord":
		#			Obs.set_sourceTransform("cbus_side",6,pos.x,pos.y,rot.z)
		#			pass
			#	elif name == "discord2":
					#Obs.set_sourceTransform("cbus_side",9,pos.x,pos.y,rot.z)
			#		pass
			if get_viewport().get_camera().name == "Camera2":
				if name == "cam1":
					#Obs.set_sourceTransform("cbus_side",4,pos.x,pos.y,rot.z)
					pass
				elif name == "Camera_logi":
					Obs.set_sourceTransform("cbus_side",3,pos.x,pos.y,rot.z)
				elif name == "discord":
					Obs.set_sourceTransform("cbus_side",6,pos.x,pos.y,rot.z)
					pass
				elif name == "discord2":
					#Obs.set_sourceTransform("cbus_side",9,pos.x,pos.y,rot.z)
					pass
