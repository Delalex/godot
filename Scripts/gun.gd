extends CollisionShape

func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_just_pressed("shoot"):
		rotate_x(-20)
		yield(get_tree().create_timer(0.1), "timeout")
		rotate_x(20)
		
		
