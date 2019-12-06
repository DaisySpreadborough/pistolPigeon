extends Node2D

var enemy = preload("res://enemy.tscn")
var ammo = preload("res://ammoBox.tscn")

var spawnSpeed = 1
var timeSinceLast = 0
var enemySpeed = 600

var maxBullets = 5
var numEnSinceLastAmmo = 0

var enemyIncrease = 0
var spawnIncrease = .01

func _ready():
	pass # Replace with function body.

func _process(delta):
	timeSinceLast += delta
	if timeSinceLast > spawnSpeed:
		enemySpeed += enemyIncrease
		spawnSpeed -= spawnIncrease
		var obj
		if numEnSinceLastAmmo > (maxBullets /2):
			obj = ammo
			numEnSinceLastAmmo = 0
		else:
			obj = enemy
			numEnSinceLastAmmo += 1
		
		if floor(rand_range(0,2)):
			spawn(obj, "left", enemySpeed)
			timeSinceLast = 0
		else:
			spawn(obj, "right", enemySpeed)
			timeSinceLast = 0
		

func spawn(object, direction, speed):
	var v = Vector2(speed, 0)
	var obj = object.instance()
	add_child(obj)
	
	if obj.is_in_group("enemy"):
		obj.connect("dead", self, "enemyDead")
	if obj.is_in_group("ammo"):
		obj.connect("destroyed", self, "ammoDestroyed")
		obj.connect("collected", self, "ammoCollected")
	
	if(direction == "left"):
		obj.position = get_node("leftSpawn").position
		obj.linear_velocity = v
	if(direction == "right"):
		v = Vector2(-speed, 0)
		obj.position = get_node("rightSpawn").position
		obj.linear_velocity = v
		
func enemyDead():
	$deadSound.play()

func ammoDestroyed():
	$ammoDead.play()

func ammoCollected():
	$reloadSound.play()