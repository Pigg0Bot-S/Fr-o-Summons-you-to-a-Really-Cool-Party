extends Sprite2D
class_name Room2D

@export var song : String = "sneaky_adventure"

# Called when the node enters the scene tree for the first time.
func _ready():
	Main.MusicMan.set_song(song)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
