
extends Node2D

func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_K:
		get_tree().change_scene("res://Assets/Scenes/DungeonGenerator.tscn")
