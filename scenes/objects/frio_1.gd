extends AdventureObject

#var object_data : Dictionary{"enabled": bool} | data about object

# Called in order to initialize object data
func _init_object():
	pass
	
# Called when the node enters the scene tree for the first time.
func _object_ready():
	if not object_data.enabled:
		return
	
	Main.Dialogue.send_chat([["frio", "AHAHAHAHAHAHAHAHAHAHAHAHAHAA", "FOOL! YOU'VE STEPPED RIGHT INTO MY TRAP CARD!", "AND NOW USING MY TAEKWONSUMMONJUTSU, I WILL MAKE YOU FEEL GREATER DESPAIR THAN YOU'VE EVER KNOWN!", "FEEL THE WRATH OF A FORCED SUMMONING TO A SHITTY HIGH SCHOOL PARTY!"]])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _object_process(delta):
	pass

# Called every frame, only when hovered
func _hovered_process(delta):
	pass

func _clicked():
	pass

func object_hovered(new_hover: bool):
	pass

func _item_interact(item , item_node : Area2D):
	pass

