extends StaticBody2D


func _ready():
	$area.connect("body_entered", self, "body_entered")
	



func _on_area_body_entered(body):
	if body.name == "Player1" and Global.Player1keys >= 3:
		queue_free()
