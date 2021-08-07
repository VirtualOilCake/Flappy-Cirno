"""
	This file is part of:
		Flappy Cirno
=============================
This script manage the Fail Scene, including the buttons and the scores.
=============================
Current version: 1.1.1
Since version: 0.2.0
=============================
Copyright (C) 2021 Oilman
"""
extends Control


# Enter the scene.
func _ready():
	print_debug("Enter fail scene.")
	var file = File.new()
	var file_path = "user://highest_score.txt"
	# If file exist:
	# Open the file, read record score from it.
	if file.file_exists(file_path):
		file.open(file_path, File.READ_WRITE)
		print("File exists at: %s" % file.get_path_absolute())
		var score = file.get_as_text()
		print("Score in file is: %s" % score)
		var int_score = int(score)
		# If score in the file is higher.
		if ValueHolder.get_score() <= int_score:
			set_label(tr("normal-end-text") % [ValueHolder.get_score(), int_score])
			ValueHolder.reset_score()
		# If score in this time is higher than the record .
		else:
			file.store_string("%d" % ValueHolder.get_score())
			set_label(tr("new-record-end-text") % ValueHolder.get_score())
			ValueHolder.reset_score()

		file.close()
	# If there is no file.
	else:
		# Create a new file.
		file.open(file_path, File.WRITE)
		print("%d" % ValueHolder.get_score())
		file.store_string("%d" % ValueHolder.get_score())
		print("creating file")
		print(file.get_path_absolute())
		file.close()


# Set the top label in this scene.
func set_label(text: String):
	get_node("Label").text = text


# Change scene to "World" to restart the game.
func _on_RestartButton_button_up():
	get_tree().change_scene("res://Scenes/World.tscn")


# Exit the game.
func _on_ExitButton_button_up():
	get_tree().quit()
