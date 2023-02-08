extends ColorRect
var open = false
onready var dialText = $PanelContainer/TextureRect/Label
var totalLines
var curLine
var choices
var choicesCount
var manuscript
export (Array) var optionButtons = []
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


func _input(event):
	if event is InputEventKey && event.pressed && open:
		curLine+= 1
		if curLine < totalLines:
			dialText.text = str(manuscript[curLine][0])
			match manuscript[curLine][1]:
				1:
					 print("First Option")
				2:
					 print("Second")
				3:
					 print("Third Option")
				4:
					 print("Fourth Option")
				5:
					 print("Fifth Option")
				_:
					print("Nothing Happnes")
		elif choicesCount>0:
			for i in choicesCount:
				optionButtons[i].visible = true
			
			print("Show Choices")
		else:
			visible = false
			open = false
		yield(get_tree().create_timer(.3), "timeout")

func questDialog(questLines, totLines, choicesIn):
	dialText.text = str(questLines[0][0])
	curLine = 0
	totalLines = totLines
	manuscript = questLines
	choices = choicesIn
	choicesCount = choicesIn.size()
	DialoguePopup()

func DialoguePopup():
	visible = true
	yield(get_tree().create_timer(.3), "timeout")
	open = true
	

