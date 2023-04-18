extends KinematicBody2D

export (float) var speed = 1.0
export (SpriteFrames) var playerFrames 
var stance = 1
var velocity = Vector2.ZERO
export (float) var jumpPow = 600
export (float) var dashPow = 10000
const GRAVITY = 30
var bump = [0, 0]
var jumpCount
var canJump = true
var crouch = true
export var midDash = false
var canDash = true
var attacking = false
export var dashCooldown = .6
onready var curshape = $StandShape
onready var halfspeed = speed*0.5


#func _input(event):
#	if event is InputEventKey && event.pressed:


func _physics_process(delta):
	if !midDash:
		if Input.is_action_pressed("left"):
			velocity.x = -speed
			$Sprite.flip_h = true
		elif Input.is_action_pressed("right"):
			velocity.x = speed
			$Sprite.flip_h = false
	
	if is_on_floor() || is_on_wall():
		jumpCount = 1
	
	if Input.is_action_just_pressed("dash") && canDash:
#		#$AnimationPlayer.play("Slide")
		Dashing()
		if $Sprite.flip_h == true:
			velocity.x = -dashPow
		else:
			velocity.x = dashPow
	if !midDash && !attacking:
		if is_on_floor() && velocity.x > 20 || is_on_floor() && velocity.x < -20 :
			$Sprite.set_animation("Run")
			print("runin")
		elif $Sprite.get_animation() == "Run":
				$Sprite.set_animation("Stance "+str(stance))
			
	
	if Input.is_action_pressed("down"):
		curshape = $CrouchShape
		crouch = true
	elif crouch == true && canDash:
		$Sprite.set_animation("Stance 1")
		curshape = $StandShape
		crouch = false
	
	
	velocity.y = velocity.y + GRAVITY
	if is_on_wall() && !Input.is_action_pressed("down"):
		velocity.y = clamp(velocity.y, 150, -10)
	if Input.is_action_just_pressed("jump") && is_on_floor() && !Input.is_action_pressed("down") && canJump:
		velocity.y = -jumpPow
		JC()
#		#$AnimationPlayer.play("KickFlip")
	elif Input.is_action_pressed("down") && Input.is_action_just_pressed("jump"):
		Drop()
	elif Input.is_action_just_pressed("jump") && jumpCount && canJump && velocity.y < 400:
		velocity.y = -jumpPow
		jumpCount-= 1
		if !$Sprite.flip_h:
			$AnimationPlayer.play("theFlip")
		else:
			$AnimationPlayer.play("theFlipLeft")
			
		JC()
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	
	if Input.is_action_just_pressed("Stance 1"):
		stance = 1
		$Sprite.set_animation("Stance 1")
		#$AnimationPlayer.play("StanceHeavy")
	if Input.is_action_just_pressed("Stance 2"):
		stance = 2
		$Sprite.set_animation("Stance 2")
		#$AnimationPlayer.play("StanceLight")
		
	if Input.is_action_just_pressed("heavy attack"):
		if stance == 1:
			#$AnimationPlayer.play("Swing 1H")
			attacking = true
			$Sprite.set_animation("Hvy Atk 1")
			yield(get_tree().create_timer(.667), "timeout")
			$Sprite.set_animation("Stance 1")
			attacking = false
			print("HA1")
		elif stance == 2:
			#$AnimationPlayer.play("Swing 2H")
			attacking = true
			$Sprite.set_animation("Hvy Atk 1")
			yield(get_tree().create_timer(.667), "timeout")
			$Sprite.set_animation("Stance 2")
			attacking = false
			
			print("HA2")
	if Input.is_action_just_pressed("light attack"):
		if stance == 1:
			#$AnimationPlayer.play("Swing 1L")
			print("LA1")
			attacking = true
			$Sprite.set_animation("Light Atk 1")
			yield(get_tree().create_timer(.4375), "timeout")
			$Sprite.set_animation("Stance 1")
			attacking = false
			
		elif stance == 2:
			#$AnimationPlayer.play("Swing 2L")
			attacking = true
			$Sprite.set_animation("Light Atk 1")
			yield(get_tree().create_timer(.4375), "timeout")
			$Sprite.set_animation("Stance 2")
			attacking = false
			print("LA2")

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

func Dashing():
	midDash = true
	canDash = false
	$Sprite.set_animation("Dash")
	
	yield(get_tree().create_timer(.15), "timeout")
	midDash = false
	#$AnimationPlayer.play("Stand")
	yield(get_tree().create_timer(dashCooldown), "timeout")
	canDash = true
	

func JC():
	canJump = false
	yield(get_tree().create_timer(.3), "timeout")
	canJump = true
	
