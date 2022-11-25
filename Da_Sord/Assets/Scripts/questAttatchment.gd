extends Area2D

export (bool) var questQuestions 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_QuestGiver_area_entered(area):
	if area.is_in_group("Player"):
		questQuestions = true


func _on_QuestGiver_area_exited(area):
	if area.is_in_group("Player"):
		questQuestions = false
