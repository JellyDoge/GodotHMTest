extends CharacterBody2D

## @onready var MainCamera = get_node("$MainCamera")

@export var max_speed: int = 200
var speed: int = max_speed

func _process(delta):
	
	# Input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# Rotate
	look_at(get_global_mouse_position())
