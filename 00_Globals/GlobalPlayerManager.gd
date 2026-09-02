extends Node

const PLAYER = preload("res://Player/player.tscn")
var completed_questions : int = 0


signal interact_pressed

var interact_handled : bool = true
var player : Player

func _ready() -> void:
	pass

func question_answered() -> void:
	completed_questions += 1
	if completed_questions == 16:
		get_tree().change_scene_to_file("res://title_scene/game_completed.tscn")
	pass

func set_player_position( _new_pos : Vector2 ) -> void:
	player.global_position = _new_pos
	pass


func set_as_parent( _p : Node2D ) -> void:
	if player.get_parent():
		player.get_parent().remove_child( player )
	_p.add_child( player )


func unparent_player( _p : Node2D ) -> void:
	_p.remove_child( player )
	

func interact() -> void:
	interact_handled = false
	interact_pressed.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
