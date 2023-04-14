extends KinematicBody2D

export var velocity = Vector2()
export var dir = -1
export var leftGoing = true
export var walk = 400
export var run = 600
const GRAVITY = 30
var justTurner = false


func _physics_process(delta):
	if is_on_floor(): 
		velocity.y = 0 
	else:
		velocity.y = velocity.y + GRAVITY
	
#	if is_on_wall():
#		leftGoing = !leftGoing
	if is_on_wall():
		print(is_on_wall())
		print(is_on_floor(), "FLOOR")
		TurnAround()
		
	if leftGoing:
		velocity.x = run * dir
	else:
		velocity.x = run * -dir
	
	move_and_slide(velocity)

func TurnAround():
	
	leftGoing = !leftGoing
	yield(get_tree().create_timer(rand_range(0.4,12)), "timeout")
	

#Chooses a random position near-ish to rabbit to move to
func ChoosePos():
	var newPos = Vector2(rand_range(1,1800), 0)

#Wait in a position, once we have it play idle animation.
func WaitAndNibble():
	yield(get_tree().create_timer(rand_range(0.4,12)), "timeout")
