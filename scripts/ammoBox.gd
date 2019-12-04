extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("ammo")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func collected():
	queue_free()

func hit():
	queue_free()

func _on_ammoBox_body_entered(body):
	pass
