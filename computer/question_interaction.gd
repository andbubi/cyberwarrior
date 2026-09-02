@tool
class_name QuestionInteraction extends Area2D

signal player_interacted
signal answered

@export var enabled : bool = true
@onready var question_text: QuestionText
@onready var question_choices : QuestionChoice
var flag : int
var question_items : Array[ QuestionItem ]
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var is_answered : bool = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Engine.is_editor_hint():
		return
		
	area_entered.connect( _on_area_enter )	
	area_exited.connect( _on_area_exit )
	
	flag = randi_range(0, 2)
	
	if flag == 0:
		question_text = $QuestionText
		question_choices = $QuestionChoice
	elif flag == 1:
		question_text = $QuestionText2
		question_choices = $QuestionChoice2
	else:
		question_text = $QuestionText3
		question_choices = $QuestionChoice3
		
	for c in get_children():
		if c is QuestionItem:
			question_items.append( c )
			
	pass

func _check_for_question_items() -> bool:
	for c in get_children():
		if c is QuestionItem:
			return true
	return false
	
func player_interact() -> void:
	player_interacted.emit()
	PlayerHud.visible = false
	QuestionSystem.start_question(question_text, question_choices)
	animation_player.play("completed_animation")
	enabled = false
	get_tree().paused = true
	pass
	
func _on_area_enter( _a : Area2D ) -> void:
	if enabled == false || question_items.size() == 0:
		return
	PlayerHud.visible = true
	PlayerManager.interact_pressed.connect( player_interact )
	pass
	
func _on_area_exit( _a : Area2D ) -> void:
	PlayerHud.visible = false
	QuestionSystem.visible = false
	Correct.visible = false
	PlayerManager.interact_pressed.disconnect( player_interact )
	pass

func _get_configuration_warnings() -> PackedStringArray:
	if _check_for_question_items() == true:
		return [ "Requires a question node." ]
	else:
		return []
	pass
