extends CSGBox


# Declare member variables here. Examples:

var thrustValue = 5;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _move_forward(delta_time):
	# Applies force to the node
	apply_impulse(Vector3(0, 0, 0), get_global_transform().basis.z.normalized() * delta_time * thrustValue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_W:
			_move_forward(get_process_delta_time())
