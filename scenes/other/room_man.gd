extends Node
signal finish_fade


var fade_speed : float
var target_fade : float = 1.0
var fading : bool = false
var new_room : Dictionary = {"switching": false, "room": ""}

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.1).timeout
	set_room("hell_bar")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Black.color.a != target_fade:
		$Black.color.a = clampf($Black.color.a+fade_speed*delta, 0.0, 1.0)
	elif fading:
		fading = false
		finish_fade.emit()
		

func switch_room(switched_room : String):
	new_room.room = switched_room
	new_room.switching = true
	pause(true)
	fade_in(1)

func set_room(new_room : String):
	var children = get_children()
	if children.size() > 1:
		children[1].queue_free()
	add_child(Main.get_room(new_room).instantiate())
	fade_out(1)
	
func pause(to_pause : bool):
	var my_room = get_child(1)
	
	if to_pause:
		my_room.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		my_room.process_mode = Node.PROCESS_MODE_INHERIT

func fade_in(fade_time : float):
	
	
	
	if not fade_time:
		return false
		
	fade_speed = 1.0/fade_time
	
	if fade_time > 0:
		$Black.color.a = 0.0
		target_fade = 1.0
	else:
		$Black.color.a = 1.0
		target_fade = 0.0
	
	fading = true

func fade_out(fade_time : float):
	fade_in(-fade_time)

func _on_finish_fade():
	if new_room.switching:
		new_room.switching = false
		set_room(new_room.room)
