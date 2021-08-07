"""
	This file is part of:
		Flappy Cirno
=============================
Script for the start scene.
=============================
Current version: 1.1.1
Since version: 0.2.0
=============================
Copyright (C) 2021 Oilman
=============================
"""
extends Node2D


# Start the main scene.
func _on_StartButton_button_up():
	get_tree().change_scene("res://Scenes/World.tscn")


# Exit.
func _on_ExitButton_button_up():
	get_tree().quit()
