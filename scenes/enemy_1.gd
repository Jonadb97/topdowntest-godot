extends Area2D

var seenPlayer = false
var motion = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.move_and_slide(motion)


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()


func _on_zombie_field_body_entered(body):
	print(body.name)
	if(body.name == 'player'):
		seenPlayer = true
		motion += position.direction_to(body.position)
	
