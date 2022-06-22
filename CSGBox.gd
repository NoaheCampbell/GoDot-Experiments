extends RigidBody


# Declare member variables here. Examples:

var thrustValue = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _move_forward(delta_time):
	# Applies force to the node
	translate(get_global_transform().basis.z.normalized() * thrustValue * delta_time)

func _move_back(delta_time):
	# Applies force to the node
	translate(get_global_transform().basis.z.normalized() * delta_time * -thrustValue)

func _move_left(delta_time):
	translate(get_global_transform().basis.x.normalized() * delta_time * -thrustValue)

func _move_right(delta_time):
	translate(get_global_transform().basis.x.normalized() * thrustValue * delta_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(_delta):
# 	# Resets the player's x and z rotation to 0
# 	rotation.x = 0
# 	rotation.z = 0

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_W:
			_move_forward(get_process_delta_time())
		elif event.scancode == KEY_S:
			_move_back(get_process_delta_time())
		elif event.scancode == KEY_A:
			_move_right(get_process_delta_time())
		elif event.scancode == KEY_D:
			_move_left(get_process_delta_time())
