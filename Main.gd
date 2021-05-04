extends Node2D

export (PackedScene) var BOOK
export var gravity = 1
export (int) var score = 0
export (int) var lifes = 3
export (bool) var off = false

func lose_life():
	lifes -= 1
	$HUD.update_life(lifes)

func _ready():
	$bookTimer.start()
	
func _process(delta):
	if lifes == 0:
		$bookTimer.stop()
		$HUD/LifeLabel.visible = false
		$HUD/ReplayLabel.visible = true
		$perdu.visible 	= true
		off = true
	if Input.is_action_pressed("replay") && off:
		score = 0
		lifes = 3
		gravity = 1
		$bookTimer.start()
		$HUD/LifeLabel.visible = true
		$HUD/ReplayLabel.visible = false
		$perdu.visible 	= false
		off = false
		$HUD.update_score(score)
		$HUD.update_life(lifes)
		
func get_gravity():
	return gravity
	
func _on_bookTimer_timeout():
	$Path2D/PathFollow2D.offset = randi()
	var book = BOOK.instance()
	add_child(book)
	get_node("BOOK").connect("less_life", self, "lose_life")
	book.set_gravity_scale(gravity)
	book.position = $Path2D/PathFollow2D.position

func _on_carton_body_entered(body):
	score += 1
	$HUD.update_score(score)
	gravity += 3
	body.free()
	
	
func game_over():
	$bookTimer.stop()
	$HUD.show_game_over()
