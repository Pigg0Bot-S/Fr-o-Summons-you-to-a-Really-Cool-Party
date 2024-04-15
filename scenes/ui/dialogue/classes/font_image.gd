extends Node
class_name FontImage

const char_registry : String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ "
var image: Image
var image_texture: ImageTexture
var height: int
var widths: Array[int]
var packed_letter: PackedScene = preload("res://scenes/ui/dialogue/letter_2d.tscn")

func _init(new_image: Image, new_height: int, new_widths: Array[int]):
	image = new_image
	image_texture = ImageTexture.create_from_image(image)
	height = new_height
	widths = new_widths
	

func get_character_length(character: String) -> int:
	return widths[char_registry.find(character)]

func get_character_region(character: String) -> Rect2:
	var char_index : int = char_registry.find(character)
	var registry_slice : String = char_registry.substr(0,char_index)
	var slice_pixels : int = 0
	
	for slice_index in range(registry_slice.length()):
		slice_pixels += widths[slice_index]
	
	
	
	return Rect2(Vector2(slice_pixels, 0), Vector2(widths[char_index], image.get_height()))

func get_char_sprite(character: String) -> Sprite2D:
	var char_rect : Rect2 = get_character_region(character)
	
	var letter : Sprite2D = packed_letter.instantiate()
	letter.texture = image_texture
	letter.set_region_rect(char_rect)
	return letter
