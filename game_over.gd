extends Control

@onready var new_game : Button = $Control/GameOver/Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game.pressed.connect(start_new_game)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func start_new_game(delta: float) -> void:
	get_tree().change_scene_to_file("res://playground.tscn")
	pass
