extends Node

var hue = 0
	
func _process(delta):
	hue += 0.002
	self.modulate = Color.from_hsv(hue, 120, 120)
