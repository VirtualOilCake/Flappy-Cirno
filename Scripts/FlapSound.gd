extends AudioStreamPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	self.add_child(timer)
	
	# Connect the timer to make it call "queue_free" after two seconds
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(1)
	timer.start()
	pass
