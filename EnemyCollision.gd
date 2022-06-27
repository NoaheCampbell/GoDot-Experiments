extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var health

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	set_max_contacts_reported(10)
	health = 3
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemy_body_entered(body:Node):
	
	if body.get_name() == "Player":
		decrement_health()


func decrement_health():
	health -= 1
	if health < 0:
		die()

func die():
	queue_free()

func get_direction(direction):
	direction = direction as String
	direction = direction.to_lower()

	if direction == "forward":
		return Vector3.FORWARD
	elif direction == "backward":
		return Vector3.BACK
	elif direction == "left":
		return Vector3.LEFT
	elif direction == "right":
		return Vector3.RIGHT
	elif direction == "up":
		return Vector3.UP
	elif direction == "down":
		return Vector3.DOWN
