extends Area2D

var open : bool = true
var open_timer : float = 5.0

@onready var AnimPlayer = $AnimationPlayer

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
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
