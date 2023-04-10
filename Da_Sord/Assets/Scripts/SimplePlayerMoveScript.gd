extends KinematicBody2D

export (float) var speed = 1.0
var stance = 1
var velocity = Vector2.ZERO
export (float) var jumpPow = 600
const GRAVITY = 30
var bump = [0, 0]


#func _input(event):
#	if event is InputEventKey && event.pressed:


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
	
	
	if Input.is_action_just_pressed("Stance 1"):
		stance = 1
		$AnimationPlayer.play("StanceHeavy")
	if Input.is_action_just_pressed("Stance 2"):
		print("Stanced Down")
		stance = 2
		$AnimationPlayer.play("StanceLight")
		
	if Input.is_action_just_pressed("heavy attack"):
		if stance == 1:
			$AnimationPlayer.play("Swing 1H")
		elif stance == 2:
			$AnimationPlayer.play("Swing 2H")
	if Input.is_action_just_pressed("light attack"):
		if stance == 1:
			print("smack")
			$AnimationPlayer.play("Swing 1L")
			
		elif stance == 2:
			$AnimationPlayer.play("Swing 2L")
			print("kerthwack!!")

func Drop():
	if get_slide_count():
		for i in get_slide_count():
			bump = get_slide_collision(i).collider
		if bump.get_groups().size():
			for i in bump.get_groups().size():
				if bump.get_groups()[i] == "Platform":
					bump.get_node("CollisionShape2D").get_parent().set_collision_layer_bit(2, false)
					yield(get_tree().create_timer(.3), "timeout")
					bump.get_node("CollisionShape2D").get_parent().set_collision_layer_bit(2, true)

#func PA():
	


