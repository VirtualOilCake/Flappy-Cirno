extends Node

const debug = true

var score = 0

func add_score():
	score+=1
	_print_score()

func get_score():
	return score
	_print_score()
	
func reset_score():
	score=0
	_print_score()

func _print_score():
	print_debug("current score is: %d"%score)
