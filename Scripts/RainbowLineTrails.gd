extends Node2D


# Declare member variables here. Examples:
var Rainbow = preload("res://Scenes/Rainbow.tscn")

onready var trail_timer = get_node("TrailsTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	trail_timer.set_wait_time(0.01)
	trail_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TrailsTimer_timeout():
	# print(get_parent().position)
	var rainbow_instance = Rainbow.instance()
	rainbow_instance.position = get_parent().position
	rainbow_instance.z_index = 0
	get_parent().get_parent().add_child(rainbow_instance)
