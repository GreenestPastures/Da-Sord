extends Area2D
export (bool) var movingTime = false



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		movingTime = true


func _on_Area2D_body_exited(body):
		if body.is_in_group("Player"):
			movingTime = false


func _input(event):
	if Input.is_action_just_pressed("interact") && movingTime:
		print("Load Scene StartingScene")
