extends CanvasLayer

@onready var button: Button = $Control/Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect( _resume )
	pass # Replace with function body.


func _resume() -> void:
	PauseScene.visible = false
	#get_tree().paused = false
	pass
