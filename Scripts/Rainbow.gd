extends Sprite

export var RAINBOW_SPEED = Vector2(-300,0)
export var FADE_SPEED = 3
func _ready():
	# Add a timer to this node
	var timer = Timer.new()
	self.add_child(timer)
	
	# Connect the timer to make it call "queue_free" after two seconds
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(1)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += RAINBOW_SPEED * delta
	modulate.a -= FADE_SPEED * delta
