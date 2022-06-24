extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_scene = load("res://player.tscn")
	var player = player_scene.instance()
	add_child(player)
	player.translate(Vector3(0, 0, 2))

	var camera = get_node("Camera")
	var playerNode = player.get_node("Player")

	if camera.get_parent():
		camera.get_parent().remove_child(camera)
	
	playerNode.add_child(camera)

	camera.translate(Vector3(0, 3, -2))

	var enemy_scene = load("res://enemy.tscn")
	var enemy = enemy_scene.instance()
	add_child(enemy)
	enemy.translate(Vector3(0, 0, -2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
