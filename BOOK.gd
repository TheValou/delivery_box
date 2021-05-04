extends RigidBody2D
signal less_life

export (PackedScene) var Main
export (int) var type

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func set_type(typ):
	type = typ
	

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	if position.y > 600:
		emit_signal("less_life")
		queue_free()
