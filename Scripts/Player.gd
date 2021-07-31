extends KinematicBody2D

const DEBUG = true

# Declare member variables here. 
const UP = Vector2(0,-1) # IDK
const FLAP = 400 # Intensity for one flap.
const GRAVITY = 20 # Gravaty for the object.

var motion = Vector2() # Motion for the object.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	
	motion.y+=GRAVITY
	
	if Input.is_action_just_pressed("flap"):
		motion.y = -FLAP
		
	motion = move_and_slide(motion,UP)
	



func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		ValueHolder.add_score()
		get_parent().get_parent().get_node("CanvasLayer/Label").text = str(ValueHolder.get_score())		

