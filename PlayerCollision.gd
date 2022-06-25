extends CSGBox


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_node
var time_between_calls

# Called when the node enters the scene tree for the first time.
func _ready():
	player_node = get_parent()
	time_between_calls = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if time_between_calls < 0:
		check_position()
	else:
		time_between_calls -= delta
		
func check_position():
	var player_position = player_node.get_position()
	if player_position.y < -5:
		player_node.die()
