extends RigidBody2D

signal dead

func _ready():
	add_to_group("enemy")

func hit():
	emit_signal("dead")
	queue_free()