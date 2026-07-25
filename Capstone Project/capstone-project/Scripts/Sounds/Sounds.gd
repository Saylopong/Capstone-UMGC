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

var volume: float = -30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	music_player = AudioStreamPlayer.new()
	music_player.process_mode = Node.PROCESS_MODE_ALWAYS
	sound_player = AudioStreamPlayer.new()
	background_player = AudioStreamPlayer.new()
	add_child(music_player)
	add_child(sound_player)
	add_child(background_player)
	set_volume()
	
func play_music(song:AudioStreamMP3):
	music_player.stream = song
	music_player.play()

func play_ogg_sound(sound: AudioStreamOggVorbis):
	sound_player.stream = sound
	sound_player.play()
	
func play_wav_sound(sound: AudioStreamWAV):
	sound_player.stream = sound
	sound_player.play()

func play_mp3_sound(sound: AudioStreamMP3):
	sound_player.stream = sound
	sound_player.play()

func change_volume(new_volume: float):
	volume = (new_volume/2.0) - 60
	if(volume == -60):
		volume = -200
	set_volume()

func set_volume():

	music_player.volume_db = volume
	background_player.volume_db = volume
	sound_player.volume_db = volume
