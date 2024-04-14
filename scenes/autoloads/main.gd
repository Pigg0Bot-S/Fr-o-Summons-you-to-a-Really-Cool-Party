extends Node

var object_states : Dictionary = {}

var rooms : Dictionary = {
	"intro_room" = load("res://scenes/rooms/intro_room.tscn"),
	"test_room" = load("res://scenes/rooms/test_room.tscn")
}

var item_textures : Dictionary = {
	"orb_of_dev" = preload("res://assets/sprites/items/orb_of_dev.png")
}

var God : Node
var MusicMan : AudioStreamPlayer
var Cursor : Area2D
var RoomMan : Node
var Inventory : Area2D

func get_room(new_room : String) -> PackedScene:
	return rooms[new_room]

func get_item_texture(new_texture : String) -> CompressedTexture2D:
	return item_textures[new_texture]

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
