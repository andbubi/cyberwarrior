extends Node2D

@onready var button_start: Button = $CanvasLayer/Control/ButtonStart
@onready var button_help: Button = $CanvasLayer/Control/ButtonHelp

@export var music : AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	PlayerHud.visible = false
	QuestionSystem.visible = false
	Correct.visible = false
	
	AudioManager.play_music( music )
		
	button_start.pressed.connect(start_game)
	button_help.pressed.connect(help)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.	
func start_game() -> void:
	# PlayerHud.visible = true
	PlayerManager.completed_questions = 0	
	get_tree().change_scene_to_file("res://playground.tscn")
	pass
	
func help() -> void:
	get_tree().change_scene_to_file("res://title_scene/help_scene.tscn")
	pass
