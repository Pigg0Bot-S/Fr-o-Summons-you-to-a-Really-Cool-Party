extends Area2D

var loading : bool = false
var locked_mouse : bool = false
var hovered_object : WeakRef = WeakRef.new()

@onready var View = get_viewport()
@onready var AnimPlayer : AnimationPlayer = $AnimationPlayer

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = View.get_mouse_position()
	
	var objects = get_overlapping_areas()
	var sel_object : Area2D
	var last_id : int = -1
	var layer_3 : bool = false
	
	if not locked_mouse:
		if objects:
			for clickable : Area2D in objects:
				if clickable.get_collision_layer_value(3):
					layer_3 = true
					last_id = -1
				
				if layer_3 == clickable.get_collision_layer_value(3) and clickable.get_index() > last_id:
					last_id = clickable.get_index()
					sel_object = clickable
			if hovered_object.get_ref() != sel_object:
				sel_object._hovered()
				if hovered_object and hovered_object.get_ref():
					hovered_object.get_ref()._unhovered()
				hovered_object = weakref(sel_object)
		elif hovered_object.get_ref():
			hovered_object.get_ref()._unhovered()
			hovered_object = WeakRef.new()
	else:
		sel_object = hovered_object.get_ref()
	
	
	if Input.is_action_just_pressed("click") and sel_object:
		if sel_object is InventoryItem:
			locked_mouse = true
		hovered_object.get_ref()._start_clicked()
		
	
	if Input.is_action_just_released("click") and sel_object:
		locked_mouse = false
		hovered_object.get_ref()._clicked()
		
	decide_cursor_anim()

func decide_cursor_anim():
	
	if loading:
		if AnimPlayer.current_animation == "loading":
			return
		AnimPlayer.play("loading")
		return
		
	if has_overlapping_areas():
		if Input.is_action_pressed("click"):
			AnimPlayer.play("hand_click")
		else:
			AnimPlayer.play("hand_idle")
		return
	else:
		if Input.is_action_pressed("click"):
			AnimPlayer.play("click")
		else:
			AnimPlayer.play("idle")
		return

#func _input(event):
	#if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.position)
	#elif event is InputEventMouseMotion:
		#position = event.position
		#print("Mouse Motion at: ", event.position)
