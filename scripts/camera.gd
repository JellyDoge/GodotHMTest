extends Camera2D

const smooth_lean = 10.0
const scale_lean = 0.3

func lean_camera_towards_mouse(delta:float) -> void:
	var mouse_position = get_global_mouse_position()
	
	## var direction_to_mouse = (mouse_position - position).normalized()
	## var distance_to_mouse = mouse_position.distance_to(position)
	## var lean = direction_to_mouse * distance_to_mouse * scale_lean
	var lean = (mouse_position - position) * scale_lean
	
	offset = lerp(offset, lean, delta * smooth_lean)
	
func match_player_position() -> void:
	position = get_node(".").position
	
func _process(delta) -> void:
	lean_camera_towards_mouse(delta)
	match_player_position()
