extends ColorRect
var open = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#func _input(event):
#	if Input.is_action_just_pressed("interact") && !open:
#		DialoguePopup()
#	if event is InputEventKey && event.pressed && open:
#		visible = false
#		open = false

func questDialog(questLines, totLines):
	print(questLines[1],"   ",totLines)
	$PanelContainer/TextureRect/Label.text = str(questLines[1],"   ",totLines)


func DialoguePopup():
	visible = true
	yield(get_tree().create_timer(.3), "timeout")
	open = true
	

