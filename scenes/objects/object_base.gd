extends Area2D
class_name AdventureObject


@export var object_id : String
@export var enabled : bool = true

var object_data : Dictionary
var hovered : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if not Main.object_states.has(object_id):
		_first_instance()
		Main.object_states[object_id] = {"enabled": enabled}
	
	if not Main.object_states[object_id].enabled:
			process_mode = Node.PROCESS_MODE_DISABLED
			hide()
	
	object_data = Main.object_states[object_id]
	_init_object()
	
	_object_ready()

func _first_instance():
	pass

func _object_ready():
	pass

func _init_object():
	pass

func _process(delta):
	_object_process(delta)
	if hovered:
		_hovered_process(delta)

func _object_process(delta):
	pass

func _hovered_process(delta):
	pass

func enable():
	process_mode = Node.PROCESS_MODE_INHERIT
	show()
	object_data.enabled = true
	
func disable():
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()
	object_data.enabled = false



#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _clicked():
	pass

func _start_clicked():
	pass

func _hovered():
	hovered = true
	object_hovered(hovered)

func _unhovered():
	hovered = false
	object_hovered(hovered)

func object_hovered(new_hover: bool):
	pass

func _item_interact(item : String, item_node : Area2D):
	pass
