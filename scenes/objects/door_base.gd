extends AdventureObject

#var object_data : Dictionary{"enabled": bool} | data about object

@export var target_room : String
@export var open_sound : AudioStream = preload("res://assets/sfx/door_open.wav")


# Called in order to initialize object data
func _init_object():
	pass
	
# Called when the node enters the scene tree for the first time.
func _object_ready():
	if open_sound:
		$AudioStreamPlayer.stream = open_sound
	#_hovered()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _object_process(delta):
	pass

# Called every frame, only when hovered
func _hovered_process(delta):
	pass

func _clicked():
	$AudioStreamPlayer.play()
	Main.RoomMan.switch_room(target_room)

func _hovered():
	hovered = true
	object_hovered(hovered)

func _unhovered():
	hovered = false
	object_hovered(hovered)

func object_hovered(new_hover: bool):
	if new_hover:
		$Sprite2D.frame = 1
	else:
		$Sprite2D.frame = 0
