extends Control

var isOpen: bool = false

func open():
	visible = true
	isOpen = true

func close():
	visible = false
	isOpen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print($NinePatchRect/GridContainer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
