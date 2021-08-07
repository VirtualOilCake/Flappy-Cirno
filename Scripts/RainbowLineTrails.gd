"""
	This file is part of:
		Flappy Cirno
=============================
Script for rainbow elements.
=============================
Current version: 1.1.1
Since version: 0.1.0
=============================
Copyright (C) 2021 VirtualOilCake
=============================
"""
extends Node2D

var Rainbow = preload("res://Scenes/Rainbow.tscn")  # The rainbow scene.

onready var trail_timer = get_node("TrailsTimer")  # The timer.


# Called when the node enters the scene tree for the first time.
func _ready():
	trail_timer.set_wait_time(0.01)
	trail_timer.start()


func _on_TrailsTimer_timeout():
	# print(get_parent().position)
	var rainbow_instance = Rainbow.instance()
	rainbow_instance.position = get_parent().position
	rainbow_instance.z_index = 0
	get_parent().get_parent().add_child(rainbow_instance)
