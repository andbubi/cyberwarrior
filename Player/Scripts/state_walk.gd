class_name State_Walk extends State

@export var move_speed : float = 150.0

@onready var idle : State = $"../Idle" 



func Enter() -> void:
	player.UpdateAnimation("move")
	pass
	
func Exit() -> void:
	pass

func Process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("move")
	
	return null

func Physics(_delta: float) -> State:
	return null

func HandleInput( _event : InputEvent ) -> State:
	if _event.is_action_pressed("interact"):
		PlayerManager.interact()
		#if QuestionSystem.player_interacted == true:
		#if QuestionSystem.visible == false:
		#	QuestionSystem.visible = true
		#else:
		#	QuestionSystem.visible = false		
	return null	
