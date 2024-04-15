extends AdventureObject

#var object_data : Dictionary{"enabled": bool} | data about object

var broken_sprite : CompressedTexture2D = preload("res://assets/sprites/objects/hell_door2.png")


@export var target_room : String
@export var open_sound : AudioStream = preload("res://assets/sfx/door_open.wav")


# Called in order to initialize object data
func _init_object():
	if not object_data.has("broken"):
		object_data.broken = false
	
# Called when the node enters the scene tree for the first time.
func _object_ready():
	if open_sound:
		$AudioStreamPlayer.stream = open_sound
	
	if object_data.broken:
		$Sprite2D.texture = broken_sprite
	#_hovered()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _object_process(delta):
	pass

# Called every frame, only when hovered
func _hovered_process(delta):
	pass

func _clicked():
	if not object_data.broken:
		Main.Dialogue.send_chat([
			["door", "AAAAAAA NOOOOO!!!\nBIG BLACK! STOP NO GET AWAY!!!","AVARIO YOU HAVE TO STOP HIM, TAKE THE 6 DINOSPHERES AND POWER\nUP, IT'S THE ONLY WAY","AVAARIO NOOOO!! YOU'RE SUPPOSED TO STAY AWAY FROM LAVA!!!","IT LOOKS LIKE IT'S UP TO ME TO STOP YOU BIG BLACK!","AND NOTHING CAN STOP ME! BECAUSE I BELIEVE IN THE SOUL OF THE CARDSTOCK!"],
			["player", "Man this guy seems like he's in trouble!","Mentally that is!","But either way I should probably find something to help me break in and make sure!"]
		])
		return
	
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

func _item_interact(item : String, item_node : Area2D):
	pass
	if item == "fork":
		object_data.broken = true
		$AudioStreamPlayer2.play()
		$Sprite2D.texture = broken_sprite
		#$AudioStreamPlayer.stream = 
