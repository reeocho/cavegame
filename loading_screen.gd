extends Node2D

@onready var progress_bar = $ProgressBar
@export var next_scene_path:String = "res://Scenes/main.tscn"
var progress: Array[float] = []

func _ready():
	ResourceLoader.load_threaded_request(next_scene_path)
	
func _process(delta):
	var status = ResourceLoader.load_threaded_get_status(next_scene_path, progress)
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			var percentage = progress[0] * 100
			progress_bar.value = percentage
		ResourceLoader.THREAD_LOAD_LOADED:
			var scened = ResourceLoader.load_threaded_get(next_scene_path)
			get_tree().change_scene_to_packed(scened)
