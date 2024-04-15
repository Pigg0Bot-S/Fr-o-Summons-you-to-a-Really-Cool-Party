extends AdventureObject

#var object_data : Dictionary{"enabled": bool} | data about object
var yap_mode : bool = false


# Called in order to initialize object data

func _first_instance():
	yap_mode = true

func _init_object():
	pass
	
# Called when the node enters the scene tree for the first time.
func _object_ready():
	if yap_mode:
		Main.object_states.goblin2 = {"enabled": true}
		Main.Dialogue.send_dialogue(TextBlob.create_dialogue_string(["DUDE!","I'M POOPING! WHAT ARE \nYOU DOING HERE?!?"], Main.get_speaker("goblin"), Main.get_voice("goblin"))+
		[
			TextBlob.new("I was just-\nI thought-", Main.get_speaker("player"), Main.get_voice("player")),
			TextBlob.new("Whatever, have fun \nusing the bathroom with\nno door", Main.get_speaker("goblin"), Main.get_voice("goblin")),
			TextBlob.new("Oh yeah... Probably \nshould've thoug-", Main.get_speaker("player"), Main.get_voice("player")),
			TextBlob.new("IS WHAT YOU WISH I'D SAY!\nMore like HAVE FUN USING THE BATHROOM WITHOUT YOUR WALLET!", Main.get_speaker("goblin"), Main.get_voice("goblin"))], finish_scene)

func finish_scene():
	Main.Inventory.remove_item("wallet")
	disable()

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

