extends CSGBox


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player
var player_position
var player_rotation
var move_speed
var rotate_speed
var enemy_node
var target_position
var enemy_scale
var game_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/Game/Player")
	player_position = player.get_position()
	player_rotation = player.get_rotation()
	move_speed = .5
	rotate_speed = .5
	enemy_scale = Vector3(0.25, 0.25, 0.25)

	enemy_node = get_parent()		
	enemy_node = enemy_node as Node

	game_scene = get_tree().get_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if game_scene.has_node("/root/Game/Player"):
		move_enemy(delta)
		position_check()
	else:
		pass

func move_enemy(delta):
	player_position = player.get_position()
	player_rotation = player.get_rotation()

	var direction_to_player = enemy_node.get_global_transform().origin.direction_to(player_position)
	var dot_product = direction_to_player.dot(enemy_node.get_direction("forward"))

	# print(dot_product)

	if dot_product > 0:
		if dot_product <= 0.5:
			target_position = player_position
			# enemy_node.translate(target_position * move_speed * delta)
			turn_to_player()
		elif dot_product >= 0.9:
			target_position = player_position
			enemy_node.translate(target_position * move_speed * delta)
			turn_to_player()
	else:
		target_position = enemy_node.get_direction("forward")
		enemy_node.translate(target_position * move_speed * delta)
		turn_to_player()

func position_check():
	if enemy_node.global_transform.origin.y <= -5:
		enemy_node.decrement_health()

func turn_to_player():
	var global_position = enemy_node.global_transform.origin
	var global_rotation = enemy_node.global_transform.basis.orthonormalized()
	var wtransform = enemy_node.global_transform.looking_at(Vector3(player_position.x, global_position.y, player_position.z), 
					 enemy_node.get_direction("up"))
	var wrotation = Quat(global_rotation).slerp(wtransform.basis.orthonormalized(), 1)

	global_transform = Transform(Basis(wrotation), global_transform.origin)
