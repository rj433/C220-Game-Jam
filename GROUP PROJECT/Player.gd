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


<<<<<<< Updated upstream

func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")
=======
func _on_backdoor1_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")


func _on_backdoor2_body_entered(body):
	get_tree().change_scene("res://Level2.tscn")


func _on_backdoor3_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")


func _on_keydoor3_body_entered(body):
	get_tree().change_scene("res://Keyroom3.tscn")


func _on_goback1_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")



func _on_goback2_body_entered(body):
	get_tree().change_scene("res://Bossroom.tscn")
>>>>>>> Stashed changes


func _on_keydoor1_body_entered(body):
	get_tree().change_scene("res://Keyroom1.tscn")
