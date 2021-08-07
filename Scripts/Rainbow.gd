"""
	This file is part of:
		Flappy Cirno
=============================
The script for rainbow tail behind the player.
This is not the most effective way, but I can't find a better way.
Anyway, it works.
=============================
Current version: 1.1.1
Since version: 1.1.0
=============================
Copyright (C) 2021 Oilman
"""
extends Sprite

export var RAINBOW_SPEED = Vector2(-300, 0)  # How fast the rainbow is.
export var FADE_SPEED = 3  # How quick the rainbow will fade away.


func _ready():
	# Add a timer to this node
	var timer = Timer.new()
	self.add_child(timer)

	# Connect the timer to make it call "queue_free" after 1 seconds
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(1)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += RAINBOW_SPEED * delta  # Change the position.
	modulate.a -= FADE_SPEED * delta  # Change the transparency.
