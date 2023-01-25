extends Area2D
export (bool) var movingTime = false
export (String) var spotPlaceDestination 
onready var spotPlace = get_node(spotPlaceDestination)



#func _physics_process(delta):
#	position.x = spotPlace.x
#	position.y = spotPlace.y




func _input(event):
	if Input.is_action_just_pressed("interact") && movingTime:
		print("Load Scene StartingScene")
		get_tree().change_scene(spotPlaceDestination)


func _on_Doorway_body_entered(body):
	if body.is_in_group("Player"):
		movingTime = true
	print("Entered")
		


func _on_Doorway_body_exited(body):
	if body.is_in_group("Player"):
		movingTime = false
		print("left")
