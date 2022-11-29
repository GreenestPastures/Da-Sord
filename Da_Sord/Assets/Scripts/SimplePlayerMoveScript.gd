extends KinematicBody2D

export (float) var speed = 1
var velocity = Vector2.ZERO
export (float) var jumpPow = 600
const GRAVITY = 30

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite.flip_h = true
	elif Input.is_action_pressed("right"):
		velocity.x = speed
		$Sprite.flip_h = false

	velocity.y = velocity.y + GRAVITY
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jumpPow
		$AnimationPlayer.play("KickFlip")
	velocity = move_and_slide(velocity,Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.2)


