extends RigidBody


# Declare member variables here. Examples:

var speed = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	set_max_contacts_reported(10)

func _move_forward(_delta_time):
	# Applies force to the node
	translate(Vector3.FORWARD * speed * _delta_time)

func _move_back(_delta_time):
	# Applies force to the node
	translate(Vector3.BACK * speed * _delta_time)

func _move_left(_delta_time):
	translate(Vector3.LEFT * speed * _delta_time)

func _move_right(_delta_time):
	translate(Vector3.RIGHT * speed * _delta_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_W:
			_move_forward(get_process_delta_time())
		elif event.scancode == KEY_S:
			_move_back(get_process_delta_time())
		elif event.scancode == KEY_A:
			_move_left(get_process_delta_time())
		elif event.scancode == KEY_D:
			_move_right(get_process_delta_time())

func _on_RigidBody_body_entered(body:Node):
	if body.get_name() == "Enemy":
		print("Hit enemy")
	else:
		print("Hit something else")
