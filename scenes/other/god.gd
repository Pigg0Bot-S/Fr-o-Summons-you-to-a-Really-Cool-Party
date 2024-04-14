extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Main.God = self
	Main.MusicMan = $MusicMan
	Main.RoomMan = $RoomMan
	Main.Cursor = $Cursor


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
