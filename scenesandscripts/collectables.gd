extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var fruit := "idk"

var path :String
var is_collected := false

func _ready():
	path = str(get_path())
	if path in EVENT.collected:
		queue_free()
		return
	animated_sprite_2d.animation_finished.connect(play)
	animated_sprite_2d.play("default")
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and !is_collected:
		EVENT[fruit] += 1
		EVENT.collected.append(path)
		is_collected = true
		animated_sprite_2d.play("collected")

func play():
	queue_free()
