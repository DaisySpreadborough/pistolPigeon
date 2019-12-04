extends RigidBody2D

var timeCreated = 0
var lifeSpan = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeCreated += delta
	if timeCreated > lifeSpan:
		queue_free()


func _on_bullet_body_entered(body):
	if body.has_method("hit"):
		body.hit()
	queue_free()
