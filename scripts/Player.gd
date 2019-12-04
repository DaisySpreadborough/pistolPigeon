extends Node2D

var bullet = preload("res://bullet.tscn")

var bulletSpeed = 500

var numBullets = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("bulletsLeft").text = str(numBullets)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _physics_process(delta):

	
func _input(event):
	if event.is_action_pressed("ui_right"):
		changeDirection("right")
		if numBullets > 0:
			shoot("right")
	if event.is_action_pressed("ui_left"):
		changeDirection("left")
		if numBullets > 0:
			shoot("left")

func changeDirection(string):
	var direction = ""
	if string == "right" or string == "left":
		direction = string
	if direction == "left":
		get_node("Sprite").set_flip_h(false)
	if direction == "right":
		get_node("Sprite").set_flip_h(true)

func shoot(direction):
	numBullets -= 1
	get_node("bulletsLeft").text = str(numBullets)
	if direction == "right":
		var v = Vector2(1,0)
		var bull = bullet.instance()
		add_child(bull)
		bull.position = get_node("rightBulletPos").position
		bull.linear_velocity = v * bulletSpeed
	if direction == "left":
		var v = Vector2(-1,0)
		var bull = bullet.instance()
		add_child(bull)
		bull.position = get_node("leftBulletPos").position
		bull.linear_velocity = v * bulletSpeed

func reload(nBullets):
	numBullets += nBullets
	get_node("bulletsLeft").text = str(numBullets)

func _on_Player_body_entered(body):
	if body.is_in_group("ammo"):
		reload(5)
		body.queue_free()
	if body.is_in_group("enemy"):
		get_tree().change_scene("res://MainMenu.tscn")