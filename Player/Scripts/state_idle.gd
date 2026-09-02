class_name State_Idle extends State

@onready var move : State = $"../Walk" 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func Enter() -> void:
	player.UpdateAnimation("idle")
	pass
	
func Exit() -> void:
	pass

func Process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return move
	player.velocity = Vector2.ZERO
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
