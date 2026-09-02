@tool
class_name QuestionItem extends Node

@export var question : ComputerResource

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	check_question()
	
func check_question() -> void:
	if question == null:
		var c = self
		var _checking : bool = true
		while _checking == true:
			c = c.get_parent()
			if c:
				if c is Computer and c.computer_resource:
					question = c.computer_resource
					_checking = false
			else:
				_checking = false
		
