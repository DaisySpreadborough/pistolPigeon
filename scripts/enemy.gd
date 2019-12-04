extends RigidBody2D

func _ready():
	add_to_group("enemy")
	pass # Replace with function body.

func hit():
	queue_free()