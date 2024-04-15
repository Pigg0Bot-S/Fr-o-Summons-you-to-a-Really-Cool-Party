extends Control


var SYSTEM_BACK = preload("res://assets/sprites/ui/speech_bubble.png")
var DIALOGUE_BACK = preload("res://assets/sprites/ui/speech_bubble.png")

enum Mode {
	DIALOGUE,
	SYSTEM
}

var current_mode : Mode

@onready var TextController : Control = $TextController

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$DialogueBoxStyle.process_mode = Node.PROCESS_MODE_DISABLED
	Main.in_message = false
	$Speaker.hide()
	#add_child(Main.get_font("goofy_font").get_char_sprite("C"))
	#await get_tree().create_timer(0.1).timeout
	#send_dialogue(TextBlob.create_dialogue_string(["This is a test message!", "Heyy, this is another one!", "Bro is TESTING rn...\nI dig it!"], Main.get_speaker("devon"), Main.get_voice("devon"))+[TextBlob.new("This is another test!")])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_mode(new_mode):
	var mode : Mode
	if new_mode is Mode:
		mode = new_mode
	elif new_mode is String:
		var lower_mode = new_mode.to_lower()
		
		if lower_mode == "dialogue":
			mode = Mode.DIALOGUE
		elif lower_mode == "box":
			mode = Mode.SYSTEM
		else:
			push_error("Invalid mode: ", new_mode)
	else:
		push_error("Invalid type, set_mode() only accepts string or Mode")
	
	current_mode = mode
	
	update_dialogue()

func update_dialogue():
	var BoxBack : TextureRect = $DialogueBoxStyle
	
	
	if current_mode == Mode.DIALOGUE:
		BoxBack.texture = DIALOGUE_BACK
	elif current_mode == Mode.SYSTEM:
		BoxBack.texture = SYSTEM_BACK
	else:
		push_error("Invalid mode: ", current_mode)
	

var text_queue : Array = []
var queue_callback : Callable

func nothing():
	return

func end_queue():
	set_visibility(false)
	queue_callback.call()

func send_text(text : TextBlob, callback : Callable = nothing):
	text_queue = [text]
	queue_callback = callback
	
	if not Main.in_message:
		play_queue()

func send_dialogue(texts : Array, callback : Callable = nothing):
	text_queue = texts
	queue_callback = callback
	
	if not Main.in_message:
		play_queue()


func send_chat(dialogues : Array, callback : Callable = nothing):
	
	var final_dialogue : Array = []
	
	for dialogue : Array in dialogues:
		var chatter : String = dialogue[0]
		
		for message in dialogue.slice(1):
			final_dialogue.append(TextBlob.new(message, Main.get_speaker(chatter), Main.get_voice(chatter)))
	
	send_dialogue(final_dialogue, callback)
		

func play_queue():
	set_visibility(true)
	
	start_speaker()
	var text = text_queue.pop_front()
	TextController.send_text(text)


func set_visibility(to_enable : bool):
	
	if to_enable:
		show()
		$DialogueBoxStyle.process_mode = Node.PROCESS_MODE_INHERIT
		Main.in_message = true
		Main.RoomMan.pause(true)
	else:
		hide()
		$DialogueBoxStyle.process_mode = Node.PROCESS_MODE_DISABLED
		Main.in_message = false
		Main.RoomMan.pause(false)
		$Speaker.hide()

func handle_click():
	
	if not TextController.text_finished:
		TextController.finish_now()
		return
	
	if text_queue:
		play_queue()
	else:
		end_queue()

func set_speaker(speaker_texture = null):
	if speaker_texture:
		$Speaker.show()
		$Speaker.texture = speaker_texture
		return
	
	$Speaker.hide()

func start_speaker():
	$AnimationPlayer.play("talk")

func stop_speaker():
	$AnimationPlayer.play("RESET")
