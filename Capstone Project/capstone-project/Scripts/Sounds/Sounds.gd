extends Node

var music_player: AudioStreamPlayer
var sound_player: AudioStreamPlayer
var background_player: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_player = AudioStreamPlayer.new()
	music_player.process_mode = Node.PROCESS_MODE_ALWAYS
	sound_player = AudioStreamPlayer.new()
	background_player = AudioStreamPlayer.new()
	add_child(music_player)
	add_child(sound_player)
	add_child(background_player)
	SignalHub.volume.connect(set_volume)
	SignalHub.current_song.connect(play_music)
	SignalHub.emit_volume()
	music_player.finished.connect(get_next_song)
	play_music(DataManager.MUSIC.list.get(0))
	

#used to play mp3 formated music
func play_music(song:Music):
	music_player.stream = song.mp3
	music_player.play()

#used to play ogg formated sound effects
func play_ogg_sound(sound: AudioStreamOggVorbis):
	sound_player.stream = sound
	sound_player.play()

#used to play wav formated sound effects
func play_wav_sound(sound: AudioStreamWAV):
	sound_player.stream = sound
	sound_player.play()

#used to play mp3 formated sound effects
func play_mp3_sound(sound: AudioStreamMP3):
	sound_player.stream = sound
	sound_player.play()

#is called when SignalHub emits "volume" signal
#sets volume for all  players
func set_volume(vol: float):
	if(vol != -50.0):
		music_player.volume_db = vol
		background_player.volume_db = vol
		sound_player.volume_db = vol
	else:
		music_player.volume_db = -200
		background_player.volume_db = -200
		sound_player.volume_db = -200

func get_next_song():
	if (DataManager.MUSIC.list.find(DataManager.current_song) >= DataManager.MUSIC.list.size()-1):
		DataManager.current_song = DataManager.MUSIC.list.get(0)
	else:DataManager.current_song = (
	 		DataManager.MUSIC.list.get(
			DataManager.MUSIC.list.find(
			DataManager.current_song)+1))
	SignalHub.emit_current_song(DataManager.current_song)
	
