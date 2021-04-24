extends Area2D

func _ready():
	connect("body_entered", self, "body_entered")
	
func body_entered(body):
	if body.name == "Player1":
		Global.Player1keys += 1 
		queue_free()
