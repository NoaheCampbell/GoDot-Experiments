extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var previous_player_rotation
var player
var camera

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()
	previous_player_rotation = Quat(player.global_transform.basis)
	camera = player.get_node("Camera")


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(_delta):

# 	var current_rotation = Quat(player.global_transform.basis)
# 	if abs(current_rotation.x - previous_player_rotation.x) > 0.5 || abs(current_rotation.z - previous_player_rotation.z) > 0.5:
# 		previous_player_rotation = current_rotation
# 		camera.rotate_x(-current_rotation.x)
# 		camera.rotate_z(-current_rotation.z)
		
