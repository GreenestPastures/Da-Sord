extends Area2D
export (Texture) var EntranceSprite
export (String) var DungeonSceneString
var movingTime = false
onready var DungeonScene = get_node(DungeonSceneString)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$EntranceSprite.texture = EntranceSprite

func _input(event):
	if Input.is_action_just_pressed("interact") && movingTime:
		print("Load Scene ", DungeonSceneString)
		get_tree().change_scene(DungeonSceneString)


func _on_Doorway_body_entered(body):
	if body.is_in_group("Player"):
		movingTime = true
	print("Entered")
		


func _on_Doorway_body_exited(body):
	if body.is_in_group("Player"):
		movingTime = false
		print("left")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
