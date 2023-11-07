extends CanvasLayer

@onready var inventory = $inventory

func _input(event):
	if event.is_action_pressed("inventory"):
		if inventory.isOpen:
			inventory.close()
			$inventorySound.play()
		else:
			inventory.open()
			$inventorySound.play()

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
