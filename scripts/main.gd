extends Node2D

func _ready():
	$Player.connect("gameOver", Callable(self, "showGameOver"))
	pass # Replace with function body.

func restart():
	get_tree().reload_current_scene()

func showGameOver():
	$gameOver/Score.text = "Score = " + str($Spawner.enemyKilled)
	
	$gameOver.show()
	$Player.hide()
	$Player.queue_free()
	