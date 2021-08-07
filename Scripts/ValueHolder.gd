"""
	This file is part of:
		Flappy Cirno
=============================
Hold some global values, which can be accessed everywhere.
I know this is not a good habit, but it works.
=============================
Current version: 1.1.1
Since version: 0.2.0
=============================
Copyright (C) 2021 Oilman
=============================
"""
extends Node

const debug = true

var score = 0


# Add score by one.
func add_score():
	score += 1
	_print_score()


func get_score():
	return score
	_print_score()


func reset_score():
	score = 0
	_print_score()


func _print_score():
	print_debug("current score is: %d" % score)
