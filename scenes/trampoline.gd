extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("idle")
	animated_sprite_2d.animation_finished.connect(lo)


func lo():
	animated_sprite_2d.play("idle")



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.velocity.y > 0:
			animated_sprite_2d.play("jump")
			EVENT._tram.emit()
