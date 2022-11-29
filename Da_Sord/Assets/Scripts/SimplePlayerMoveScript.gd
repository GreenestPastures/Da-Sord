extends KinematicBody2D

export (float) var speed = 1
var velocity = Vector2.ZERO
export (float) var jumpPow = 600
const GRAVITY = 30
var bump = [0, 0]

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite.flip_h = true
	elif Input.is_action_pressed("right"):
		velocity.x = speed
		$Sprite.flip_h = false

	velocity.y = velocity.y + GRAVITY
	if Input.is_action_just_pressed("jump") && is_on_floor() && !Input.is_action_pressed("down"):
		velocity.y = -jumpPow
		$AnimationPlayer.play("KickFlip")
	elif Input.is_action_pressed("down") && Input.is_action_just_pressed("jump"):
		Drop()
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.2)

func Drop():
	for i in get_slide_count():
		bump = get_slide_collision(i).collider
	for i in bump.get_groups().size():
		if bump.get_groups()[i] == "Platform":
			bump.get_node("CollisionShape2D").disabled = true
			yield(get_tree().create_timer(.3), "timeout")
			bump.get_node("CollisionShape2D").disabled = false
			


