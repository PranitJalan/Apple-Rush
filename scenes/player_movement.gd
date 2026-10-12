extends CharacterBody2D

@export_group("Movement")
@export var ACCELERATION := 600
@export var FRICTION := 400
@export var GRAVITY := 1300
@export var MAXSPEED := 500
var jump := false
var direction := 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input()
	set_movement(delta)
	move_and_slide()


func get_input():
	direction = Input.get_axis("left", "right")
	
	if Input.is_action_just_pressed("jump"):
		jump = true
		
		
	


func set_movement(delta):
	if  is_on_floor():
		velocity.y = 0
	else:
		velocity.y += GRAVITY*delta
	
	if jump and is_on_floor:
		velocity.y += -300     
		jump = false
		

	if direction:
		velocity.x = move_toward(velocity.x, MAXSPEED*direction, ACCELERATION*delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION*delta)
	pass
	
	
