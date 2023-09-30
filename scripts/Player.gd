extends CharacterBody2D

@onready var MainCamera = get_node("%Camera2D")

const moveSpeed = 300
const accel = 9999
const friction = 5000

const SPRITE_WIDTH = 16
var input = Vector2.ZERO

## func _physics_process(delta):
	## player_movement(delta)
	## look_at(get_global_mouse_position())
	
	## if Input.is_action_pressed("Mouse1"):
		## shoot()

func _process(delta):
	player_movement(delta)
	look_at(get_global_mouse_position())
	
func get_input():
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(moveSpeed)
	
	move_and_slide()
