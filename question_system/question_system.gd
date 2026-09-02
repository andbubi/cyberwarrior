@tool
class_name QuestionSystemLayer extends CanvasLayer


#@export var computer : Computer
signal started
signal answered

var is_active : bool = false
var right_answer : String = ""
var selected_option : String = ""

@onready var question_ui: Control = $QuestionUI
@onready var question: RichTextLabel = $QuestionUI/RichTextLabel
@onready var yes: Button = $QuestionUI/Yes
@onready var no: Button = $QuestionUI/No


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Engine.is_editor_hint():
		if get_viewport() is Window:
			get_parent().remove_child( self )
			return
		return
		
	yes.pressed.connect(on_answer_yes)
	no.pressed.connect(on_answer_no)
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if is_active == false:
		return
	#if event.is_action_pressed("interact"):
		#start_question()
	

func start_question(text : QuestionText, choice : QuestionChoice) -> void:
	question.text = text.text
	yes.text = choice.choices.get(0)
	no.text = choice.choices.get(1)
	right_answer = choice.correct_choice
	show_question()
	pass


func show_question() -> void:
	is_active = true
	QuestionSystem.visible = true
	question_ui.visible = true
	question_ui.process_mode = Node.PROCESS_MODE_ALWAYS
	started.emit()
	pass

func on_answer_yes() -> void:
	selected_option = yes.text
	answer_question()
	pass
	
func on_answer_no() -> void:
	selected_option = no.text
	answer_question()
	pass

func answer_question() -> void:
	if right_answer == selected_option:
		PlayerManager.question_answered()
		if PlayerManager.completed_questions < 16:
			Correct.visible = true
	else:
		get_tree().change_scene_to_file("res://title_scene/game_over.tscn")
	is_active = false
	QuestionSystem.visible = false
	question_ui.visible = false
	question_ui.process_mode = Node.PROCESS_MODE_DISABLED
	get_tree().paused = false
	pass	
	
func success() -> void:
	QuestionSystem.visible = false
	PlayerManager.question_answered()
	pass

func game_over() -> void:
	QuestionSystem.visible = false
	get_tree().change_scene_to_file("res://title_scene/game_over.tscn")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
