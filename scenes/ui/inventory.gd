extends Area2D

var item_scene : PackedScene = preload("res://scenes/ui/inv_item.tscn")

var open : bool = true
var open_timer : float = 5.0

@onready var AnimPlayer = $AnimationPlayer
@onready var ItemHolder = $CollisionShape2D/Sprite2D
## Called when the node enters the scene tree for the first time.
func _ready():
	Main.Inventory = self
#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("open_inventory") and not has_overlapping_areas():
		set_open(not open)
	
	if open_timer and not has_overlapping_areas():
		open_timer = clampf(open_timer - delta, 0.0, 5.0)
	elif has_overlapping_areas():
		set_open(true)
		open_timer = 5.0
	else:
		set_open(false)

func set_open(new_state: bool):
	if open == new_state:
		return
	open = new_state
	
	if new_state:
		open_timer = 5.0
	
	var new_time : float = 0.0
	
	if AnimPlayer.is_playing():
		new_time = 0.22 - AnimPlayer.current_animation_position
		
	if new_state:
		AnimPlayer.play("open")
	else:
		AnimPlayer.play("close")
	
	AnimPlayer.seek(new_time)

func return_items():
	for child in ItemHolder.get_children():
		child.return_home()

func add_item(new_item : String):
	var item = item_scene.instantiate()
	
	item.item_id = new_item
	
	ItemHolder.add_child(item)
	set_open(true)
