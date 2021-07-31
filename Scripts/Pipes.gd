extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEED = -2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	position += Vector2(SPEED,0)
