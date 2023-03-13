extends ColorRect
export(String, "Rebecca", "Mary", "Leah") var character_name

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(character_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
