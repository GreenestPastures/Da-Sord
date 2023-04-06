extends Area2D
export (Texture) var EntranceSprite
export (String) var DungeonScene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$EntranceSprite.texture = EntranceSprite
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
