"""
	This file is part of:
		Flappy Cirno
=============================
The script for flap sound.
I cannot find a better way to play one sound file for more than one at the time.
=============================
Current version: 1.1.1
Since version: 1.1.0
=============================
Copyright (C) 2021 VirtualOilCake
=============================
"""

extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	self.add_child(timer)

	# Connect the timer to make it call "queue_free" after 1 second.
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(1)
	# However, it seems like this won't actually destroy the object for some reason.
	timer.start()
