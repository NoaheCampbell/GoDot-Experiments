extends RigidBody


# Declare member variables here. Examples:

var move_speed = 5
var rotate_speed = 5
var player_node
var health
var player_scale = Vector3(2, 6, 2)

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	set_max_contacts_reported(10)
	player_node = get_parent()
	health = 3
	scale = player_scale

func move_forward(_delta_time):
	# Applies force to the node
	translate(Vector3.FORWARD * move_speed * _delta_time)

func move_back(_delta_time):
	# Applies force to the node
	translate(Vector3.BACK * move_speed * _delta_time)

func move_left(_delta_time):
	translate(Vector3.LEFT * move_speed * _delta_time)

func move_right(_delta_time):
	translate(Vector3.RIGHT * move_speed * _delta_time)

func rotate_left(_delta_time):
	rotate(Vector3.UP, rotate_speed * _delta_time)

func rotate_right(_delta_time):
	rotate(Vector3.UP, -rotate_speed * _delta_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventKey and event.pressed:

		# Handles movement
		if event.scancode == KEY_W or event.scancode == KEY_UP:
			move_forward(get_process_delta_time())
		if event.scancode == KEY_S or event.scancode == KEY_DOWN:
			move_back(get_process_delta_time())
		if event.scancode == KEY_A or event.scancode == KEY_LEFT:
			move_left(get_process_delta_time())
		if event.scancode == KEY_D or event.scancode == KEY_RIGHT:
			move_right(get_process_delta_time())
		
		# Handles rotation
		if event.scancode == KEY_Q:
			rotate_left(get_process_delta_time())
		if event.scancode == KEY_E:
			rotate_right(get_process_delta_time())

func _on_RigidBody_body_entered(body:Node):
	if body.get_name() == "Enemy":
		decrement_health()


func get_position():
	return get_translation()

func die():
	queue_free()

func decrement_health():
	if health > 0:
		health -= 1
		translate(Vector3(0, 0, 2))
	else:
		die()
