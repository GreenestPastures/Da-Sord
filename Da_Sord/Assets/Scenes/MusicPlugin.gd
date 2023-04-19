extends Node2D
export (AudioStream) var musicTrack

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/BackgroundMusic".stream = musicTrack
	$"/root/BackgroundMusic".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
