@tool
class_name Computer extends Node2D
@onready var animation_player: AnimationPlayer = $QuestionInteraction/AnimationPlayer
@onready var interaction_area: Area2D = $QuestionInteraction
@onready var sprite_2d: Sprite2D = $QuestionInteraction/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Engine.is_editor_hint():
		return
	gather_question()
	pass # Replace with function body.

func _set_computer_resource( _q : ComputerResource ) -> void:
	#computer_resource = _q
	pass

func gather_question() -> void:
	for c in get_children():
		if c is QuestionInteraction:
			c.player_interacted.connect( _on_interaction )
			c.answered.connect( _on_answer )
	pass

func _on_interaction() -> void:
	animation_player.stop()
	
	#if computer_resource.is_answered == true:
		#PlayerHud.visible = false
	pass
	
func _on_answer() -> void:
	#computer_resource.is_answered = true
	animation_player.play("completed_animation")
	pass


#func player_interact() -> void:
	#QuestionSystem.visible = true
	#pass
	
#func _on_area_enter( _a : Area2D ) -> void:
	#PlayerManager.interact_pressed.connect( player_interact )
	#PlayerHud.visible = true
	#pass
	
#func _on_area_exit( _a : Area2D ) -> void:
	#PlayerManager.interact_pressed.disconnect( player_interact )
	#PlayerHud.visible = false
	#pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
