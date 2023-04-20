extends Control
export var startSceneString = "res://Assets/Scenes/HubArea.tscn"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode:
			get_tree().change_scene(startSceneString)
