extends CharacterBody2D

@export_group("Movement")
@export var ACCELERATION := 600
@export var FRICTION := 700
@export var GRAVITY := 1300
@export var MAXSPEED := 150
var locked := false
var jump := false
var direction := 1
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input()
	if not locked:
		play()
		set_movement(delta)
		move_and_slide()
func play():
	if direction:
		sprite_2d.play("run")
		if direction == 1:
			sprite_2d.flip_h = false
		else:
			sprite_2d.flip_h = true
	else:
		sprite_2d.play("default")
	if not is_on_floor():
		if velocity.y > 0:
			sprite_2d.play("fall")
		else:
			if velocity.y < 0:
				sprite_2d.play("jump")
func get_input():
	direction = Input.get_axis("left", "right")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump = true
func set_movement(delta):
	if  is_on_floor():
		pass
	else:
		velocity.y += GRAVITY*delta
	if jump and is_on_floor:
			velocity.y += -400    
			jump = false
	if direction:
		velocity.x = move_toward(velocity.x, MAXSPEED*direction, ACCELERATION*delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION*delta)
	pass
func _ready():
	EVENT._player_died.connect(on_player_died)
	EVENT._tram.connect(trampoline)
	sprite_2d.animation_finished.connect(_on_finish)
	position = EVENT.spawn_position
func on_player_died():
		sprite_2d.play_backwards("death")
		locked = true
func _on_finish():
	if sprite_2d.animation == "death":
		locked = false
		position = EVENT.spawn_position
func trampoline():
	velocity.y -= 440
