extends Node
export (Array, Array, String) var sentences = []
export (Array, Array, String) var choice = []
export (int) onready var lines = sentences.size()
export (int) onready var lastLine = lines-1
export (bool) var questQuestions 
var currentCol


func _ready():
	print(sentences[lastLine])



func _on_QuestGiver_body_entered(touching):
	if touching.is_in_group("Player"):
		questQuestions = true
		currentCol = touching


func _on_QuestGiver_body_exited(area):
	if area.is_in_group("Player"):
		questQuestions = false

func _input(event):
	if Input.is_action_just_pressed("interact") && questQuestions:
		currentCol.get_node("Camera2D/CanvasLayer/DialogueItem").questDialog(sentences, lines, choice)
