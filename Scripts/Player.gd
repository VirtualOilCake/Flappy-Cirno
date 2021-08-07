"""
	This file is part of:
		Flappy Cirno
=============================
The script to manage player's behaver.
=============================
Current version: 1.1.1
Since version: 0.1.0
=============================
Copyright (C) 2021 VirtualOilCake
"""

extends KinematicBody2D

const DEBUG = true

# Declare member variables here. 
const UP = Vector2(0, -1)  # IDK
const FLAP: float = 300.0  # Intensity for one flap.
const GRAVITY: float = 20.0  # Gravity for the object.
# const ROTATION_ACCELERATION = 10

var FlapSoundPlayer = preload("res://Scenes/FlapSound.tscn")

var motion = Vector2()  # Motion for the object.


func _ready():
	# The light is very annoying in the scene editor, so I set it to invisible.
	get_node("Light2D").visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Falling
	motion.y += GRAVITY * delta * 50

	# When flap
	if Input.is_action_just_pressed("flap"):
		flap()

	# IDK 
	motion = move_and_slide(motion, UP)


# Get point when enter pipes' detect area.
func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		get_point()


func _on_Detect_body_entered(body):
	print("Hit: %s" % body.name)
	if body.name == "UpperPipe":
		game_fail()
	if body.name == "LowerPipe":
		game_fail()


# The action when the player flap.
# This method is called in both _on_Button_button_down() and _physics_process(delta)
func flap():
	motion.y = -FLAP
	play_flap_sound()


# This is a button cover the whole interface.
# Just for touch screen support.
func _on_Button_button_down():
	flap()


func play_flap_sound():
	add_child(FlapSoundPlayer.instance())


func game_fail():
	get_tree().change_scene("res://Scenes/FailScene.tscn")


func get_point():
	ValueHolder.add_score()
	get_parent().get_parent().get_node("CanvasLayer/Label").text = str(ValueHolder.get_score())
	get_node("AudioStreamPlayer").play()


func _on_UpperAndLowerArea_area_entered(area):
	if area.name == "PlayerArea":
		game_fail()
