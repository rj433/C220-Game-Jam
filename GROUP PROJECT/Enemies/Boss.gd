extends KinematicBody2D

export var constraint_left = Vector2(1353,358)
export var constraint_right = Vector2(2348,358)
export var speed = 5
onready var _animated_sprite = $AnimatedSprite


func _ready():
	_animated_sprite.play("Walk")

func _physics_process(_delta):
	if not $Tween.is_active():
		var constraint = constraint_left
		$AnimatedSprite.flip_h = false
		if position != constraint_right:
			constraint = constraint_right
			$AnimatedSprite.flip_h = true 
		$Tween.interpolate_property(self, "position", position, constraint, speed, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()


func _on_Boss_area_body_entered(body):
	if body.name == "Player":
		body.queue_free()
		get_tree().reload_current_scene()


func _on_Boss_area2_body_entered(body):
	if body.name == "Player":
		_animated_sprite.play("Attack")


func _on_Boss_area2_body_exited(body):
	_animated_sprite.play("Walk")
