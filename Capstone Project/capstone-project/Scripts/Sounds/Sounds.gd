extends Node

#Music
const _8_BIT_MORNING = preload("uid://d38fjvcs5064b")
const MIDNIGHT_PILLOW_DRIFT = preload("uid://b1hhrejhoykcv")
const SUMMER_GARDEN = preload("uid://behrqnfbs5oh6")

#Sound Effects
const DOOR_OGG = preload("uid://36a3d48j3huh")
const PAGE_TURNING_WAV = preload("uid://jo4232vfyyk8")
const COMFORTER_SOUND_MP3 = preload("uid://d0ukkbpq7e2dg")


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
	SignalHub.emit_volume()

#used to play mp3 formated music
func play_music(song:AudioStreamMP3):
	music_player.stream = song
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
		
