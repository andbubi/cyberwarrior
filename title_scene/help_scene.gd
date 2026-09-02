extends Node2D

@onready var button_return: Button = $CanvasLayer/Control/ButtonBack
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_return.pressed.connect(return_home)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func return_home() -> void:
	get_tree().change_scene_to_file("res://title_scene/title_scene.tscn")
	pass
