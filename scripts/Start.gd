extends TextureButton

var main = preload("res://main.tscn")

func _ready():
	pass # Replace with function body.



func _on_Start_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
