extends Node

var object_states : Dictionary = {}

var rooms : Dictionary = {
	"intro_room" = load("res://scenes/rooms/intro_room.tscn"),
	"test_room" = load("res://scenes/rooms/test_room.tscn"),
	"hell_bar" = load("res://scenes/rooms/hell_bar.tscn"),
	"hell_bathroom" = load("res://scenes/rooms/hell_bathroom.tscn"),
	"hell_bar2" = load("res://scenes/rooms/hell_bar_2.tscn")
}

var item_textures : Dictionary = {
	"orb_of_dev" = preload("res://assets/sprites/items/orb_of_dev.png"),
	"fork" = preload("res://assets/sprites/items/fork.png"),
	"money" = preload("res://assets/sprites/items/money.png"),
	"wallet" = preload("res://assets/sprites/items/wallet.png")
}

var speakers : Dictionary = {
	"devon" = preload("res://assets/portraits/devon.png"),
	"date" = preload("res://assets/portraits/date.png"),
	"door" = preload("res://assets/portraits/door.png"),
	"player" = preload("res://assets/portraits/player.png"),
	"goblin" = preload("res://assets/portraits/goblin.png"),
	"system" = preload("res://assets/portraits/system.png"),
	"frio" = preload("res://assets/portraits/frio.png")
}


var PermaLoads : Dictionary = {
	"fonts": {
		"white_peaberry": FontImage.new(preload("res://assets/fonts/white_peaberry.png"), 17, [12,10,10,10,10,10,10,10,10,9,10,10,12,10,12,10,12,10,10,10,10,12,12,12,12,10,11,10,9,10,9,10,10,10,6,8,9,6,12,10,10,10,10,10,8,9,10,10,12,10,10,10,10,10,10,10,10,10,10,10,10,10,6,9,12,10,13,11,6,7,7,10,10,6,8,6,8,6,7,9,9,9,10,12,6,8,6,12,10,7,8,4,7,13,3])
	},
	"voices": {
		"default": preload("res://assets/sfx/dialoguefx.wav"),
		"door"   : preload("res://assets/sfx/dialoguefx.wav"),
		"devon"  : preload("res://assets/sfx/devon_talk.wav"),
		"player" : preload("res://assets/sfx/player_talk.wav"),
		"date"   : preload("res://assets/sfx/date_talk.wav"),
		"goblin" : preload("res://assets/sfx/goblin_talk.wav"),
		"frio"   : preload("res://assets/sfx/frio_speak.wav")
	}
}


func get_font(font : String):
	return PermaLoads["fonts"][font.to_lower()]

func get_voice(voice : String):
	return PermaLoads["voices"][voice.to_lower()]

var God : Node
var MusicMan : AudioStreamPlayer
var Cursor : Area2D
var RoomMan : Node
var Inventory : Area2D
var Dialogue : Control
var in_message : bool = false

func get_room(new_room : String) -> PackedScene:
	return rooms[new_room]

func get_item_texture(new_texture : String) -> CompressedTexture2D:
	return item_textures[new_texture]
	
func get_speaker(new_speaker : String) -> CompressedTexture2D:
	return speakers[new_speaker]

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
