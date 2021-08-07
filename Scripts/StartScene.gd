extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Start the main scene.
func _on_StartButton_button_up():
	get_tree().change_scene("res://Scenes/World.tscn")


# Exit.
func _on_ExitButton_button_up():
	get_tree().quit()
