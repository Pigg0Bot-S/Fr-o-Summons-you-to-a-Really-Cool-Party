extends Area2D
class_name InventoryItem

@export var item_id : String

#var object_data : Dictionary
var hovered : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _start_clicked():
	pass

func _clicked():
	pass
	
func object_hovered(new_hover: bool):
	pass
	
func _hovered():
	hovered = true
	object_hovered(hovered)

func _unhovered():
	hovered = false
	object_hovered(hovered)



