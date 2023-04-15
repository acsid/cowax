extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var OBSpassword = "OLwRAL9xKaFWdzds"
var OBSurl = "ws://127.0.0.1:4455"


var currentScene = "cbus_side"

var _WS = WebSocketClient.new()
var err;

var _WS_protocol = 1
var connected = false
var _RNG = RandomNumberGenerator.new()

func _REQUESTID():
	_RNG.randomize()
	var rid = _RNG.randf(1,999)
	return rid

func _startWS():
	_WS.connect("connection_closed",self,"_WS_closed")
	_WS.connect("connection_error",self,"_WS_closed")
	_WS.connect("connection_established",self,"_WS_connected")
	_WS.connect("data_received", self, "_WS_data")
	err = _WS.connect_to_url(OBSurl)
	_LOG(err)
	if err != OK:
		print("Websocket unable to connect")

func _LOG(text,err = ""):
	print("[OBS] ",text)

func _WS_closed(was_clean = false):
	_LOG("Websocket Closed " , was_clean )
	connected = false

func _WS_connected(proto = ""):
	_LOG("Websocket Connected " , proto)
	connected = false

func _WS_data():
	var packet= _WS.get_peer(1).get_packet()
	var parsed_data = JSON.parse(packet.get_string_from_utf8()).result
	print(parsed_data)
	_OBS_parse(parsed_data)
	
func _OBS_parse(data):
	var packet
	if data["op"] == 0:
		_LOG("AUTH...")
		#1st step Concantenante password with salt (password + salt)
		var secret = Marshalls.raw_to_base64((OBSpassword + data["d"]["authentication"]["salt"]).sha256_buffer())
		var reply =  Marshalls.raw_to_base64((secret + data["d"]["authentication"]["challenge"]).sha256_buffer())
		_LOG(reply)
		packet = {
			"op": 1,
			"d": {
				"rpcVersion": _WS_protocol,
				"authentication": reply
				# "eventSubscriptions": 33
				 }
		}
	if data["op"] == 2:
		if _WS_protocol == data["d"]["negotiatedRpcVersion"]:
			_LOG("Compatible protocol detected")
			connected = true
	if data["op"] == 5:
		var d = data["d"]
		if d["eventType"] == "CurrentProgramSceneChanged":
			_LOG("scene changed to: "  + d["eventData"]["sceneName"])
			currentScene = d["eventData"]["sceneName"]
	if packet:
		_WS.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)
		_WS.get_peer(1).put_packet(JSON.print(packet).to_utf8())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_WS.poll()
# Called when the node enters the scene tree for the first time.
func _ready():
	_startWS()

func get_currentScene():
	return currentScene

func set_scene(scene):
	if connected:
		var packet
		packet = {
		"op": 6,
			"d": {
				"requestType": "SetCurrentProgramScene",
				"requestId": scene,
				"requestData": {
					"sceneName": scene
				}
				# "eventSubscriptions": 33
			}
		}
		if packet:
			_WS.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)
			_WS.get_peer(1).put_packet(JSON.print(packet).to_utf8())
			
			
func set_sourceTransform(scene,source,x=0,y=0,rotation = 0):
	if connected:
		var packet
		packet = {
		"op": 6,
			"d": {
				"requestType": "SetSceneItemTransform",
				"requestId": scene,
				"requestData":{
					"sceneName": scene,
					"sceneItemId": source,
					"sceneItemTransform": {
						"positionX": x,
						"positionY": y,
						"rotation": -rotation
						}
					}
				# "eventSubscriptions": 33
				 }
		}
		if packet:
			_WS.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)
			_WS.get_peer(1).put_packet(JSON.print(packet).to_utf8())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
