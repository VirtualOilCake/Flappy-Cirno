extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	var file_path = "user://highest_score.txt"
	if file.file_exists(file_path):
		file.open(file_path,File.READ_WRITE)
		print("File exists at: %s"%file.get_path_absolute())
		var score = file.get_as_text()
		print("Score in file is: %s"%score)
		
		var int_score = int(score)
		
		if ValueHolder.get_score()  <= int_score:
			set_label("Try better next time!\nCurrent Score:%d, Highest Score:%d"%[ValueHolder.get_score(),int_score])
			ValueHolder.reset_score()
		else :
			file.store_string("%d"%ValueHolder.get_score())
			set_label("Great Job!\nNew Record: %d"%ValueHolder.get_score())
			ValueHolder.reset_score()
		
		file.close()
	# If there is no file.
	# Create a new file.
	else:
		file.open(file_path,File.WRITE)
		print("%d"%ValueHolder.get_score())
		file.store_string("%d"%ValueHolder.get_score())
		print("creating file")
		print(file.get_path_absolute()) 
		file.close()
	pass # Replace with function body.

func set_label(text:String):
	get_node("Label").text = text


func _on_StartButton_button_up():
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_ExitButton_button_up():
	get_tree().quit()
