extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 300
const GRAVITY = 30
const JUMPFORCE = -900



func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		
	velocity.y = velocity.y + 30
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity,Vector2.UP)
		
	velocity.x = lerp(velocity.x,0,0.2)

	

func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")


func _on_keydoor1_body_entered(body):
	get_tree().change_scene("res://Keyroom1.tscn")


