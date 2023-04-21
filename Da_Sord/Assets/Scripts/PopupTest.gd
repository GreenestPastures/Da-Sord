extends ColorRect
var open = false
onready var dialText = $PanelContainer/TextureRect/Label
var totalLines
var curLine
var curChoice = 0
var choices
var availableChoices = []
var choicesCount
var manuscript
export var optionButtons = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	optionButtons.append($VBoxContainer/Op1)
	optionButtons.append($VBoxContainer/Op2)
	optionButtons.append($VBoxContainer/Op3)
	optionButtons.append($VBoxContainer/Op4)
	optionButtons.append($VBoxContainer/Op5)

	pass # Replace with function body.


func questDialog(questLines, totLines, choicesIn):
	dialText.text = str(questLines[0][0])
	print("==> ", questLines[0])
	curLine = 0
	curChoice = 0
	totalLines = totLines
	manuscript = questLines
	choices = choicesIn
	choicesCount = choicesIn.size()
	
	for i in choices.size():
		if int(choices[i][2]) == curChoice:
			availableChoices.append(choices[i])
	DialoguePopup()




func _input(event):
	if (event is InputEventKey || event is InputEventMouseButton) && open:
		if (event.pressed):
			ProgressDialogue()

#Here we check the butts
func buttCheck(buttIndex):
	curChoice = int(choices[buttIndex][1])
	totalLines = manuscript[curChoice].size()
	curLine = 0
	for i in optionButtons.size():
		optionButtons[i].visible = false
	availableChoices.clear()
	for i in choices.size():
		if int(choices[i][2]) == curChoice:
			availableChoices.append(choices[i])

func ProgressDialogue():
	curLine+= 1
	UpdateDialogue()

func UpdateDialogue():
	if curLine < totalLines:
		dialText.text = str(manuscript[curChoice][curLine])
	elif availableChoices.size()>0:
		for i in availableChoices.size():
			optionButtons[i].visible = true
			optionButtons[i].set_text(availableChoices[i][0])
			optionButtons[i].set_pressed(false)
	else:
		visible = false
		open = false
	yield(get_tree().create_timer(.3), "timeout")


func DialoguePopup():
	visible = true
	yield(get_tree().create_timer(.3), "timeout")
	open = true
	UpdateDialogue()


