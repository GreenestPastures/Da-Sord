extends Sprite
onready var regSprite = get_parent().get_node("Sprite")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if !get_parent().midDash:
		texture = regSprite.texture
		flip_h = regSprite.flip_h
		rotation = regSprite.rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
