extends AudioStreamPlayer
var swinging = false
var heavy = false
export var swingpSpeed = 0.25
export (Array, AudioStream) var lightSounds
export (Array, AudioStream) var heavySounds
export (AudioStream) var curSound


# Declare member variables here. Examples:
# var a = 2
# var b = "text"





func SwingSoundOff(heavyBool, delay):
	if heavyBool:
		curSound = heavySounds[randi() % heavySounds.size()]
		#Choose Heavy Swing Sound
	else:
		curSound = lightSounds[randi() % lightSounds.size()]
		#Choose light swing sound
	if !swinging:
		swinging = !swinging
		stream = curSound
		play()
		yield(get_tree().create_timer(delay), "timeout")
		swinging = !swinging
	
#	if !footstep:
#		footstep = true
#		if leftFoot:
#			stream = stepSound1
#		else:
#			stream = stepSound2
#		leftFoot = !leftFoot
#		play()
#		yield(get_tree().create_timer(stepSpeed), "timeout")
#		footstep = false

