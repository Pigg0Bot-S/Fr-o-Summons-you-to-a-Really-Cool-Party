extends Object
class_name SFX_Data

enum StreamPlayerType {
	STANDARD,
	SPACIAL2D,
	SPACIAL3D
}

var paths : Array[String]
var pitch_var : Array[float]


func _init(audio_paths : Array[String], pitch_variability : Array[float] = [1.0, 1.0]):
	randomize()
	paths = audio_paths
	pitch_var = pitch_variability

func get_stream() -> AudioStreamWAV:
	return ResourceLoader.load_threaded_get(paths.pick_random())

func get_pitch() -> float:
	return randf_range(pitch_var[0], pitch_var[1])
	
func set_player(stream_player, do_stream : bool = true, do_pitch_var : bool = true):
	if do_stream:
		stream_player.stream = get_stream()
	if do_pitch_var:
		stream_player.pitch_scale = get_pitch()

func spawn_player(spawn_parent, stream_type : StreamPlayerType = StreamPlayerType.STANDARD, strm_index_override : int = -1, pitch_var_override : float = -1.0):
	var spawn_stream : AudioStreamWAV
	var spawn_pitch : float
	var spawn_type
	
	if strm_index_override == -1:
		spawn_stream = ResourceLoader.load_threaded_get(paths[strm_index_override])
	else:
		spawn_stream = get_stream()
	
	if pitch_var_override == -1.0:
		spawn_pitch = pitch_var_override
	else:
		spawn_pitch = get_pitch()
		
	match stream_type:
		StreamPlayerType.STANDARD:
			spawn_type = AudioStreamPlayer.new()
		StreamPlayerType.SPACIAL2D:
			spawn_type = AudioStreamPlayer2D.new()
		StreamPlayerType.SPACIAL3D:
			spawn_type = AudioStreamPlayer3D.new()
			
	
	spawn_type.pitch_scale = spawn_pitch
	spawn_type.stream = spawn_stream
	
	spawn_parent.add_child(spawn_type)
