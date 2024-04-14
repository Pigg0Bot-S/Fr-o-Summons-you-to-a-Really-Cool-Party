extends Node

var object_states : Dictionary = {}

var rooms : Dictionary = {
	"intro_room" = load("res://scenes/rooms/intro_room.tscn"),
	"test_room" = load("res://scenes/rooms/test_room.tscn")
}
var God : Node
var MusicMan : AudioStreamPlayer
var Cursor : Area2D
var RoomMan : Node

func get_room(new_room : String) -> PackedScene:
	return rooms[new_room]

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
