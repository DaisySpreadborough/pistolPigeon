extends Node2D

func _ready():
	$Player.connect("gameOver", self, "showGameOver")
	pass # Replace with function body.

func restart():
	get_tree().reload_current_scene()

func showGameOver():
	$gameOver.show()
	$Player.hide()
	$Player.queue_free()
	