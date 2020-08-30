extends Node

#Network
const DEFAULT_IP = '127.0.0.1'
const DEFAULT_PORT = 31400
const MAX_PLAYERS = 5

var player_info = {}
var my_info = { name = '', position = Vector2(360, 180), idx = null }

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func create_server(player_nickname):
	my_info.name = player_nickname
	#players[1] = self_data
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)

func connect_to_server(player_nickname):
	my_info.name = player_nickname
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(DEFAULT_IP, DEFAULT_PORT)
	get_tree().set_network_peer(peer)

func _connected_ok():
	pass # Only called on clients, not server. Will go unused; not useful here.

func _player_disconnected(id):
	rpc("remove_player", id)
	player_info.erase(id) # Erase player from info

func _player_connected(id):
	rpc_id(id, "register_player", my_info)

remote func register_player(info):
	# Get the id of the RPC sender.
	var id = get_tree().get_rpc_sender_id()
	# Store the info
	player_info[id] = info

remotesync func remove_player(id):
	#get_node("Playerlist").remove_item(player_info[id].idx)
	#get_parent().get_node(".").get_node(str(id)).queue_free()
	pass
