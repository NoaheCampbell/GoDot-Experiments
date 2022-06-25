extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_node
var enemy_node

# Called when the node enters the scene tree for the first time.
func _ready():
	var player_scene = load("res://player.tscn")
	var player = player_scene.instance()
	add_child(player)
	player.translate(Vector3(0, 0, 2))

	var enemy_scene = load("res://enemy.tscn")
	enemy_node = enemy_scene.instance()
	add_child(enemy_node)
	enemy_node.translate(Vector3(0, 0, -2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
