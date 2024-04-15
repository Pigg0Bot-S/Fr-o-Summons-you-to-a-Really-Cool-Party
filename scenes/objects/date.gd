extends AdventureObject

#var object_data : Dictionary{"enabled": bool} | data about object
var yap_mode : bool = false

func _first_instance():
	yap_mode = true

# Called in order to initialize object data
func _init_object():
	pass
	
# Called when the node enters the scene tree for the first time.
func _object_ready():
	if yap_mode:
		
		Main.Dialogue.send_chat(
			[
				["date", "So babe, how's your night?"],
				["player", "Pretty good, hby babe?"],
				["date", "Oh, well y'know...", "Work's been busy.", "Got summoned 3 times today, and it took a lot out of me.", "It all paid off though, since I get to spend tonight with you!"],
				["player", "Hold that thought babe, I gotta piss real bad..."]
			]
		)
		
		#Main.Dialogue.send_dialogue(
			#[
				#TextBlob.new("So babe, how's your \nnight?", Main.get_speaker("date"), Main.get_voice("date")),
				#TextBlob.new("Pretty good, hby babe?", Main.get_speaker("player"), Main.get_voice("player"))]+
				#TextBlob.create_dialogue_string(["Oh, well y'know...","Work's been.. busy.","Got summoned 3 times today. \nSo that's something \nright?"], Main.get_speaker("date"), Main.get_voice("date"))+
				#[TextBlob.new("Hold that thought babe, \nI gotta piss real bad..", Main.get_speaker("player"), Main.get_voice("player")),
				#])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _object_process(delta):
	pass

# Called every frame, only when hovered
func _hovered_process(delta):
	pass

func _clicked():
	if Main.object_states.has("goblin"):
		if Main.object_states.has("frio1") and Main.object_states.frio1.enabled:
			Main.Dialogue.send_chat([["player", "The goblin stole my wallet, you think I should get it from him?"], ["date", "He what!?", "Yeah no, I'd probably get that back from him.", "And maybe call the demon cops."]])
		else:
			Main.Dialogue.send_text(TextBlob.new("Did you see that goblin \nrun upstairs? \nWhat were you doing \nin there?", Main.get_speaker("date"), Main.get_voice("date")))
		return
	
	Main.Dialogue.send_dialogue(TextBlob.create_dialogue_string(["Where you goin babe?\nFood's almost here!"], Main.get_speaker("date"), Main.get_voice("date"))+[TextBlob.new("I'll be back soon, \npromise!", Main.get_speaker("player"), Main.get_voice("player"))])

func object_hovered(new_hover: bool):
	pass

func _item_interact(item , item_node : Area2D):
	pass

