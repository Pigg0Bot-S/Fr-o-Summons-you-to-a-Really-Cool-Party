extends Object
class_name TextBlob

var text : String
var font : FontImage
var sound : AudioStream
var speaker

static func create_dialogue_string(texts : Array[String], set_speaker = null, set_sound : AudioStream = Main.get_voice("default"), set_font : FontImage = Main.get_font("white_peaberry")) -> Array[TextBlob]:
	
	var return_array : Array[TextBlob] = []
	
	for text in texts:
		return_array.append(TextBlob.new(text, set_speaker, set_sound, set_font))
	
	return return_array

func _init(set_text : String, set_speaker = null, set_sound : AudioStream = Main.get_voice("default"), set_font : FontImage = Main.get_font("white_peaberry")):
	text = set_text
	font = set_font
	sound = set_sound
	speaker = set_speaker
