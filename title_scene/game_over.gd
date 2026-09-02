extends Node2D

@export var music : AudioStream
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioManager.play_music( music )
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		get_tree().change_scene_to_file("res://title_scene/title_scene.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
