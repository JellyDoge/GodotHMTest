extends AnimationPlayer

var input = Vector2.ZERO

func _process(delta):
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	print(input.x)

	match input.x:
		1:
