extends Area2D


func _ready():
	pass
	
func body_entered(body):
	if body.name == "Player1" and body.get("keys") > 2:
		get_tree().change_scene("res://Bossroom.tscn")
