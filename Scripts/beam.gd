extends KinematicBody

var SPEED = 20

func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()

func _physics_process(_delta):
	var moving_vector = Vector3()
	moving_vector.z += SPEED
	move_and_slide(Vector3(0,0,moving_vector.z))
