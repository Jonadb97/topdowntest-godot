extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = get_viewport().get_mouse_position();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_viewport().get_mouse_position();
