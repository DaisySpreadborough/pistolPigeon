extends RigidBody2D

signal collected
signal destroyed

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("ammo")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func collecteditem():
	emit_signal("collected")
	queue_free()

func hit():
	emit_signal("destroyed")
	queue_free()

func _on_ammoBox_body_entered(body):
	pass
