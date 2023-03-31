extends Node
#var sentenceInputs = load("res://Assets/Scripts/testScript3.gd")
export (Array, Array)var sentences
export (Array, Array) var choice = []
export (Array, Array, int) var Bazinga
export (int) onready var lines = sentences.size()
export (int) onready var lastLine = lines-1
export (bool) var questQuestions 
var currentCol


func _ready():
	print(sentences[lastLine][0])


func sentenceLine(lineNumber, sentence, choiceNumber):
	return

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
