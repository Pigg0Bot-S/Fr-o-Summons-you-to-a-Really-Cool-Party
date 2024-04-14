extends AudioStreamPlayer

var music_registry: Dictionary = {
	"sneaky_snitch": load("res://assets/music/Sneaky Adventure.mp3"),
	"sneaky_adventure": load("res://assets/music/Sneaky Snitch.mp3")
}

var current_song : String

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func set_song(song: String):
	if current_song == song or current_song == "none":
		return
	
	current_song = song
	stream = music_registry[song]
	play()
