extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_node
var enemy_node
var game_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	game_scene = get_tree().get_current_scene()

	var player_scene = load("res://player.tscn")
	var player = player_scene.instance()
	add_child(player)
	player.translate(Vector3(0, 10, 2))

	player_node = player.get_node("Player")
	var player_parent = player_node.get_parent()
	player_parent.remove_child(player_node)
	game_scene.add_child(player_node)


	var enemy_scene = load("res://enemy.tscn")
	var enemy = enemy_scene.instance()
	add_child(enemy)
	enemy.translate(Vector3(0, 10, -10))

	enemy_node = enemy.get_node("Enemy")
	var enemy_parent = enemy_node.get_parent()
	enemy_parent.remove_child(enemy_node)
	game_scene.add_child(enemy_node)
	enemy_node.rotate_y(180)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
