extends KinematicBody2D

export var velocity = Vector2()
export var dir = -1
export var leftGoing = true
export var walk = 400
export var run = 600
const GRAVITY = 30
var justTurner = false
export var health = 15
var velTrack = true




func _physics_process(delta):
	if health <= 0:
		die()
	velocity.y += GRAVITY
	#      ABOUT TO CHANGE THE WHOLE THING TO USE RAYCASTS, WHICH I NEED TO CHASE THE PLAYER ANYWAY
	if is_on_wall():
		TurnAround()
	
	if is_on_floor():# && velTrack:
		velocity.y = 5
		if leftGoing:
			velocity.x = run * dir
		else:
			velocity.x = run * -dir
	move_and_slide(velocity, Vector2.UP)
	
func TurnAround():
	if !justTurner:
		justTurner = true
		leftGoing = !leftGoing
		velocity.x *= -1
		yield(get_tree().create_timer(.3), "timeout")
		justTurner = false
	
	
	

#Chooses a random position near-ish to rabbit to move to
func ChoosePos():
	var newPos = Vector2(rand_range(1,1800), 0)

#Wait in a position, play idle animation once we have it.
func WaitAndNibble():
	yield(get_tree().create_timer(rand_range(0.4,12)), "timeout")

func TakeDamage(dam, knockBack, atkDir):
	print("Owie! And other various rabbit noises")
	#This is where I'll state the Rabbit recieves damage and Knockback based -
	# -off of stats provided by players attacks
	velTrack = false
	health -= dam
	velocity = Vector2((global_position - atkDir) * knockBack)
#	velocity = Vector2.move_toward(atkDir, knockBack)
	move_and_slide(velocity, Vector2.UP)
	yield(get_tree().create_timer(.3), "timeout")
	velTrack = true
	
func die():
	print("\"Aw I fokin died\" in rabbitnese")
	queue_free()
