extends KinematicBody2D

export (float) var speed = 1
var motion = Vector2.ZERO


func _physics_process(delta):
	if Input.is_action_pressed("left"):
		motion.x = -speed
	elif Input.is_action_pressed("right"):
		motion.x = speed
	else:
		motion.x = 0
	
	motion = move_and_slide(motion)
