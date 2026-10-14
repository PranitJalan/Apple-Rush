extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready():
	animated_sprite_2d.animation_finished.connect(play)
	animated_sprite_2d.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		EVENT.collectables += 1
		animated_sprite_2d.play("collected")
		print(EVENT.collectables)

func play():
	animated_sprite_2d.play("default")
