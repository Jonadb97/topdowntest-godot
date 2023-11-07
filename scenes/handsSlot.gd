extends Node2D

var duration_pressed = 0
var pressed = false

func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	load_mp3("res://sounds/Teleport.mp3")
	
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		$handsSlotPlayer.play("use")
		self.rotate(get_angle_to(get_viewport().get_mouse_position()))
		
	if (Input.is_action_just_pressed("teleport")):
		pressed = true
		duration_pressed = 0
	
	if (Input.is_action_pressed("teleport")):
		if(pressed):
			duration_pressed += 1

		if(duration_pressed > 10):
			teleport()
			pressed = false
			duration_pressed = 0
			
	if (Input.is_action_just_released("teleport")):
		pressed = false
		duration_pressed = 0

func teleport():
	$AudioTeleport.play()
	var mousePosition = get_viewport().get_mouse_position()
	get_parent().position = mousePosition
