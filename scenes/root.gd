extends Node2D

var items

func read_from_JSON(path):
	var file = FileAccess.open("res://assets/items.json", FileAccess.READ)
	if file.file_exists(path):
		var data = JSON.parse_string(file.get_as_text())
		file.close()
		return data
	else:
		printerr("Invalid path given")

# Called when the node enters the scene tree for the first time.
func _ready():
	items = read_from_JSON("res://assets/items.json")
	
	for key in items:
		items[key]["key"] = key


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("exit")):
		get_tree().quit()

func get_item_by_key(key):
	if items and items.has(key):
		return items[key].duplicate(true)
		
