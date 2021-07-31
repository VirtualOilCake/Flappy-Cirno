extends Node2D

# Declare member variables here.
const DEBUG = true
const RANDOM_RANGE = 40 # random range of the hight of the pipes

var Pipes = preload("res://Scenes/PipeNode2D.tscn")

onready var pipe_in_timer = get_node("PipeInTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pipe_in_timer.set_wait_time(1)
	pipe_in_timer.start()

func add_pipes_with_time(time:float):
	var timer = Timer.new()
	timer.set_wait_time(1)
	timer.start()
	
	pass
	
	
func add_new_pipes():
	var base_new_pipe_position = Vector2(450,95)
	# Create a new pipe instance.
	var pipe_instance = Pipes.instance()
	var new_pipe_hight = rand_range(-RANDOM_RANGE,RANDOM_RANGE)
	if	DEBUG:
		print_debug("This pipe hight is: %d"%new_pipe_hight)
		
	pipe_instance.position = base_new_pipe_position # rand_range is related to up and down.
	pipe_instance.position[1] +=new_pipe_hight 
	# Add the instance to the parent, which is the world node.
	get_parent().call_deferred("add_child",pipe_instance)

func _on_Resetter_area_entered(area):
	if area.name=="PipesArea":
		# add_new_pipes()
		area.queue_free() 
	if DEBUG:
			print_debug("area name is: %s"%area.name)

func _on_PipeInTimer_timeout():
	add_new_pipes()
