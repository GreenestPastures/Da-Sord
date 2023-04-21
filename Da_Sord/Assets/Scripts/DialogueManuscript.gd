extends Node
export (Array, Array, String) var sentences = []
export (Array, Array, String) var choice = []
export (int) onready var lines = sentences.size()
export (int) onready var lastLine = lines-1
export (bool) var questQuestions 
export (bool) var playerTalking = false
var tempPlayer
var currentCol


func _ready():
	connect("body_entered", self, "_on_QuestGiver_body_entered")
	connect("body_exited", self, "_on_QuestGiver_body_exited")
	#MAKE THIS WORK


func _on_QuestGiver_body_entered(touching):
	print(touching)	
	if touching.is_in_group("Player"):
		questQuestions = true
		currentCol = touching
		tempPlayer = touching


func _on_QuestGiver_body_exited(area):
	if area.is_in_group("Player"):
		questQuestions = false
		playerTalking = false

func _input(event):
	if Input.is_action_just_pressed("interact") && questQuestions && !tempPlayer.get_node("Camera2D/CanvasLayer/DialogueItem").visible:
		currentCol.get_node("Camera2D/CanvasLayer/DialogueItem").questDialog(sentences, lines, choice)
