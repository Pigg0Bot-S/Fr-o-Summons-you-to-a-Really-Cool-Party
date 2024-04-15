extends Control

const FPC : int = 2 # Frames Per Character

var char_spacing: int = 1
var line_spacing: int = 5
var text_target: String
var written_text: String
var target_pointer: int = 0
var line_pointer: int = 0
var char_timer: int = 1
var text_finished: bool = true


@onready var SFXPlayer: AudioStreamPlayer = $"../AudioStreamPlayer"
@onready var current_font: FontImage = Main.get_font("white_peaberry")

func _ready():
	set_line_locations()
	#await get_tree().create_timer(20).timeout
	#send_text(TextBlob.new("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ "))
	
func set_line_locations():
	var kids = get_children()
	for i in range(kids.size()):
		kids[i].position = Vector2(43, 6+i*line_spacing+i*current_font.height)
		kids[i].line_width = 226


func _physics_process(_delta):
	if not text_target or text_finished:
		return
	
	if text_target == written_text:
		text_finished = true
		$"..".stop_speaker()
		return
	
	char_timer = wrapi(char_timer-1, 0, FPC)
	
	if char_timer:
		return
	
	add_character(text_target[target_pointer])
	written_text += text_target[target_pointer]
	SFXPlayer.play()
	target_pointer += 1
	

func set_boxes(offset: Vector2, widths: Array[int]):
	
	position = offset
	
	for i in range(4):
		get_node("Text"+str(i+1)).width = widths[i]
	
func set_spacing(new_char_spacing: int, new_line_spacing: int):
	char_spacing = new_char_spacing
	line_spacing = new_line_spacing

func send_text(new_text: TextBlob):
	clear_texts()
	
	$"..".set_speaker(new_text.speaker)
	text_finished = false
	current_font = new_text.font
	text_target = process_text(new_text.text)
	SFXPlayer.stream = new_text.sound

func process_text(input_text : String):
	
	var processed_string = ""
	var current_width : int = 0
	var last_whitespace = -1
	var drift : int = 0
	for i in range(input_text.length()):
		var char = input_text[i]
		
		if char == "\n":
			current_width = 0
			processed_string += "\n"
			continue
		
		if current_width:
			current_width += 1
		current_width += current_font.get_character_length(char)
		
		if current_width > 226:
			if last_whitespace < 0 or i == last_whitespace:
				current_width = 0
				processed_string += "\n"+char
				continue
			else:
				processed_string += char
				
				var extras = processed_string.substr(last_whitespace+1+drift, i-last_whitespace+1+drift)
				
				var pre_whitespace = processed_string.substr(0, last_whitespace+1+drift)
				processed_string = pre_whitespace+"\n"+extras
				
				current_width = 0
				last_whitespace = -1
				drift += 1
				for ex_char in extras:
					current_width += current_font.get_character_length(ex_char)
				continue
		if char == " ":
			last_whitespace = i
		processed_string += char
	
	#print(processed_string)
	return processed_string


func clear_texts():
	text_target = ""
	written_text = ""
	target_pointer = 0
	line_pointer = 0
	for child in get_children():
		child.text_length = 0
		for sub_child in child.get_node("CanvasGroup").get_children():
			sub_child.queue_free()

func add_character(new_char: String):
	
	if new_char == "\n":
		line_pointer = clampi(line_pointer+1,0,4)
		return
	
	var char_length: int = current_font.get_character_length(new_char)
	var sel_child : TextLineData
	
	for child : TextLineData in get_children():
		
		if child.get_index() < line_pointer:
			continue
		
		if child.text_length+char_length <= child.line_width:
			sel_child = child
			line_pointer = child.get_index()
			break
	
	if not sel_child:
		sel_child = $Text5
	
	if sel_child.text_length:
		sel_child.text_length += char_spacing
	
	var char_sprite : Sprite2D = current_font.get_char_sprite(new_char)
	
	char_sprite.position.x = sel_child.text_length + 1
	sel_child.get_node("CanvasGroup").add_child(char_sprite)
	sel_child.text_length += char_length

func finish_now():
	text_finished = true
	$"..".stop_speaker()
	for i in range(6):
		SFXPlayer.play()
	while true:
		if text_target == written_text:
			return
		
		add_character(text_target[target_pointer])
		written_text += text_target[target_pointer]
		
		target_pointer += 1
