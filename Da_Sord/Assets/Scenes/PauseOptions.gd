extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_quitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_audioButton_pressed():
	pass # Replace with function body.


func _on_resumeButton_pressed():
	get_parent().hide()
	pass # Replace with function body.
