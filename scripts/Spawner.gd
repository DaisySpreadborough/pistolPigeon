extends Node2D

var enemy = preload("res://enemy.tscn")
var ammo = preload("res://ammoBox.tscn")


var enemySpeed = 500

var timeElapsed = 0
var nextSpawn = 0
var curveFlatness = 3
var asymptope = .05
var expo = 2

var maxBullets = 5
var numEnSinceLastAmmo = 0

var enemyIncrease = 0
var spawnIncrease = .01

func _ready():
	pass # Replace with function body.

func _process(delta):
	timeElapsed += delta
	if timeElapsed > nextSpawn:
		increaseSpeed()
		var obj
		if numEnSinceLastAmmo > (maxBullets /2):
			obj = ammo
			numEnSinceLastAmmo = 0
		else:
			obj = enemy
			numEnSinceLastAmmo += 1
		
		if floor(rand_range(0,2)):
			spawn(obj, "left", enemySpeed)
		else:
			spawn(obj, "right", enemySpeed)
		

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
		
func increaseSpeed():
	var timeDiff = (curveFlatness / sqrt((5 * timeElapsed) + 20) + asymptope)
	nextSpawn = timeElapsed + timeDiff
		
func enemyDead():
	$deadSound.play()

func ammoDestroyed():
	$ammoDead.play()

func ammoCollected():
	$reloadSound.play()