extends Node
export (Array, String) var sentences = []
export (int) onready var lines = sentences.size()
export (int) onready var lastLine = lines-1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(sentences[lastLine])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
