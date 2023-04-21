extends AudioStreamPlayer2D
var footstep = false
var leftFoot = false
export var stepSpeed = 0.25
export (AudioStream) var stepSound1
export (AudioStream) var stepSound2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _process(delta):
	if get_parent().velocity.x > 20 || get_parent().velocity.x < -20:
		if get_parent().is_on_floor():
			stepTime()
	



func stepTime():
	if !footstep:
		footstep = true
		if leftFoot:
			stream = stepSound1
		else:
			stream = stepSound2
		leftFoot = !leftFoot
		play()
		yield(get_tree().create_timer(stepSpeed), "timeout")
		footstep = false

