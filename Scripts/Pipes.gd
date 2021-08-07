"""
	This file is part of:
		Flappy Cirno
=============================
The script for pipes.
=============================
Current version: 1.1.1
Since version: 0.1.0
=============================
Copyright (C) 2021 VirtualOilCake
"""
extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEED = -2.0


# Pipe will automatically move to the left.
func _physics_process(delta):
	position += Vector2(SPEED, 0) * delta
