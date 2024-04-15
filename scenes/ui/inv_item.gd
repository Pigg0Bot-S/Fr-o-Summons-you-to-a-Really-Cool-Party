extends Area2D
class_name InventoryItem

@export var item_id : String

#var object_data : Dictionary
var hovered : bool = false
var dragged : bool = false
@onready var Inventory = $"../../.."

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = Main.get_item_texture(item_id)
	$AnimationPlayer.play("startup")
	return_home()

func _process(delta):
	if dragged:
		global_position = get_viewport().get_mouse_position()

func _start_clicked():
	dragged = true

func _clicked():
	dragged = false
	if not Main.in_message:
		for object in get_overlapping_areas():
			object._item_interact(item_id, self)
	return_home()
	
func object_hovered(new_hover: bool):
	pass
	
func _hovered():
	hovered = true
	object_hovered(hovered)

func _unhovered():
	hovered = false
	object_hovered(hovered)

func re_inventory():
	Inventory.return_items()

func return_home():
	position = Vector2(37+30*get_index(), 17)

func consume():
	$"..".remove_child(self)
	re_inventory()
	queue_free()
	
