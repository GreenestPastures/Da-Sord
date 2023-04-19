extends CanvasLayer






func _input(event):
	if event is InputEventKey and event.scancode == KEY_ESCAPE:
		$Pause.popup()
