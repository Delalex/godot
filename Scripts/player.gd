extends KinematicBody

var SPEED = 4
var SHIFT_SPEED = 10
var GRAVITY = 0.5
var JUMP_STRENGHT = 10
var TURN_SPEED = 0.07
var y_pos = 0

func _ready():
	pass

func _physics_process(_delta):
	var moving_vector = Vector3()
	
	if Input.is_action_pressed("move_forwards"):
		moving_vector.z += 1
	if Input.is_action_pressed("move_backwards"):
		moving_vector.z -= 1
	if Input.is_action_pressed("move_left"):
		moving_vector.x -= 1
		rotate_y(TURN_SPEED)
	if Input.is_action_pressed("move_right"):
		moving_vector.x += 1
		rotate_y(-TURN_SPEED)
	if Input.is_action_pressed("shift"):
		SPEED = SHIFT_SPEED
	else:
		SPEED = 2
		
	moving_vector = moving_vector.normalized()
	moving_vector *= SPEED
	y_pos -= GRAVITY/2
	
	move_and_slide(transform.basis.xform(Vector3(0,y_pos, moving_vector.z)))
	
	if Input.is_action_just_pressed("jump"):
		y_pos = JUMP_STRENGHT
