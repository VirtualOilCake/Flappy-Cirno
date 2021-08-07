"""
	This file is part of:
		Flappy Cirno
=============================
The script to add and delete pipes in the world.
=============================
Current version: 1.1.1
Since version: 0.1.0
=============================
Copyright (C) 2021 VirtualOilCake
"""

extends Node2D

# Declare member variables here.
const RANDOM_RANGE = 40  # random range of the hight of the pipes

var Pipes = preload("res://Scenes/PipeNode2D.tscn")

onready var pipe_in_timer = get_node("PipeInTimer")


# Called when the node enters the scene tree for the first time.
func _ready():
	pipe_in_timer.set_wait_time(1)
	pipe_in_timer.start()


# Add two pipes with a random Y position.
func add_new_pipes():
	var base_new_pipe_position = Vector2(450, 95)  # This is almost the center.

	var pipe_instance = Pipes.instance()  # Create a new pipe instance.
	var new_pipe_height = rand_range(-RANDOM_RANGE, RANDOM_RANGE)  # Get a random height for the pipes.

	pipe_instance.position = base_new_pipe_position  # rand_range is related to up and down.
	pipe_instance.position[1] += new_pipe_height
	# Add the instance to the parent, which is the world node.
	get_parent().call_deferred("add_child", pipe_instance)

	# Debug:
	print_debug("This pipe hight is: %d" % new_pipe_height)


# Destroy pipe object when it enters the Resetter area.
func _on_Resetter_area_entered(area):
	if area.name == "PipesArea":
		area.queue_free()


# Add a new pipes when the timer is time out.
func _on_PipeInTimer_timeout():
	add_new_pipes()
