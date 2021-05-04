extends CanvasLayer

func _ready():
	pass
	
func update_life(lifes):
	$LifeLabel.text = "Vies: " + str(lifes)
	
func update_score(score):
	$ScoreLabel.text = "Score: " + str(score)
