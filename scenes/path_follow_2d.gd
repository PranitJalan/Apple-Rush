extends PathFollow2D


var SPEED := 75
var direction := 1
@export var is_looping := false




func _process(delta: float) -> void:
	if is_looping:
		loop = true
	else:
		loop = false
	progress += direction * delta * SPEED
	if progress_ratio >= 1:
		direction = -1
	elif progress_ratio <= 0:
		direction = 1
