extends MarginContainer

@onready var artist_name: Label = $VBoxContainer/Artist/Artist_Name
@onready var song_name: Label = $VBoxContainer/Song/Song_Name


func _ready() -> void:
	SignalHub.current_song.connect(next_song)
	next_song(DataManager.current_song)

func next_song(song: Music):
	artist_name.text = song.artist
	song_name.text = song.name
