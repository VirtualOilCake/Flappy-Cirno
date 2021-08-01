extends KinematicBody2D

const DEBUG = true

# Declare member variables here. 
const UP = Vector2(0,-1) # IDK
const FLAP = 300 # Intensity for one flap.
const GRAVITY = 20 # Gravaty for the object.
const ROTATION_ACCELERATION = 10


var motion = Vector2() # Motion for the object.
onready var player_image = get_node("PlayerSprite")

var current_rotation_speed = 0.0
var current_flap_rotation_speed = 0.0


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	# Falling
	motion.y+=GRAVITY * delta * 50
	
	# When flap
	if Input.is_action_just_pressed("flap"):
		# Increse hight
		motion.y = -FLAP
	motion = move_and_slide(motion,UP)
	
func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		ValueHolder.add_score()
		get_parent().get_parent().get_node("CanvasLayer/Label").text = str(ValueHolder.get_score())		

func _on_Detect_body_entered(body):
	print("Hit: %s"% body.name)
	if body.name == "UpperPipe":
		get_tree().change_scene("res://Scenes/FailScene.tscn")
	if body.name == "LowerPipe":
		get_tree().change_scene("res://Scenes/FailScene.tscn")
		
	
