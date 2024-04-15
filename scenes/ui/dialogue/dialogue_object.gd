extends Area2D

#var object_data : Dictionary{"enabled": bool} | data about object
var hovered : bool = false

@onready var Dialogue : Control = $"../.."

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
	Dialogue.handle_click()

func _start_clicked():
	pass

func _hovered():
	hovered = true

func _unhovered():
	hovered = false


#func _item_interact(item , item_node : Area2D):
	#pass

