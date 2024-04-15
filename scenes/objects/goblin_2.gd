extends AdventureObject

#var object_data : Dictionary{"enabled": bool} | data about object

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
	
	if not object_data.enabled:
		Main.Dialogue.send_chat([["goblin", "Go talk to your boyfriend about it or something, I don't know."]])
		return
	
	
	object_data.enabled = false
	Main.object_states.frio1.enabled = true
	Main.Dialogue.send_chat(
		[
			["player", "Hey! Gimme my wallet back."],
			["goblin", "You sure you want it back?", "You sure you're ready?", "Do some thinking, and come back to me again when you're SURE you want it back."]
		]
	)

func object_hovered(new_hover: bool):
	pass

func _item_interact(item , item_node : Area2D):
	pass

