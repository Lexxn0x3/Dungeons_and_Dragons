extends Node

#Network
const DEFAULT_IP = '127.0.0.1'
const DEFAULT_PORT = 31400
const MAX_PLAYERS = 5
var player_info = {}


func _initializeServer(SERVER_PORT, MAX_PLAYERS):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)

func _initializeClient(SERVER_IP, SERVER_PORT):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(SERVER_IP, SERVER_PORT)
	get_tree().set_network_peer(peer)


	
func _ready():
	pass # Replace with function body.
