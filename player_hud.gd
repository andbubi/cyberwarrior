extends CanvasLayer

@onready var enter : Control = $Control
@onready var correct : Control = $Control2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func start_new_game(delta: float) -> void:
	# get_tree().change_scene_to_node($Control/GameOver)
	pass
