extends KinematicBody2D

const DEBUG = true

# Declare member variables here. 
const UP = Vector2(0, -1)  # IDK
const FLAP = 300  # Intensity for one flap.
const GRAVITY = 20  # Gravaty for the object.
const ROTATION_ACCELERATION = 10

var FlapSoundPlayer = preload("res://Scenes/FlapSound.tscn")

var motion = Vector2()  # Motion for the object.
onready var player_image = get_node("PlayerSprite")

var current_rotation_speed = 0.0
var current_flap_rotation_speed = 0.0


func _ready():
	get_node("Light2D").visible = true
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _physics_process(delta):
	# Falling
	motion.y += GRAVITY * delta * 50

	# When flap
	if Input.is_action_just_pressed("flap"):
		flap()

	motion = move_and_slide(motion, UP)


func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		get_point()


func _on_Detect_body_entered(body):
	print("Hit: %s" % body.name)
	if body.name == "UpperPipe":
		game_fail()
	if body.name == "LowerPipe":
		game_fail()


func flap():
	motion.y = -FLAP
	play_flap_sound()


func _on_Button_button_down():
	flap()
	print("Flap because of the button")


func play_flap_sound():
	add_child(FlapSoundPlayer.instance())


func game_fail():
	get_tree().change_scene("res://Scenes/FailScene.tscn")


func get_point():
	ValueHolder.add_score()
	get_parent().get_parent().get_node("CanvasLayer/Label").text = str(ValueHolder.get_score())
	get_node("AudioStreamPlayer").play()


func _on_UpperAndLowerArea_area_entered(area):
	if area.name == "PlayerArea":
		game_fail()
