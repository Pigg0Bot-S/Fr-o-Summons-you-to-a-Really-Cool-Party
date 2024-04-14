extends AdventureObject

#var object_data : Dictionary{"enabled": bool} | data about object

# Called in order to initialize object data
func _init_object():
	pass
	
# Called when the node enters the scene tree for the first time.
func _object_ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _object_process(delta):
	pass

# Called every frame, only when hovered
func _hovered_process(delta):
	pass

func _clicked():
	Main.Inventory.add_item("orb_of_dev")

func object_hovered(new_hover: bool):
	pass

func _item_interact(item : String, item_node : Area2D):
	if item == "orb_of_dev":
		item_node.consume()
		disable()
