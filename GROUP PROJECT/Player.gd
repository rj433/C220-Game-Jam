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

	

func _on_fallzone_body_entered(_body):
	get_tree().change_scene("res://Level1.tscn")


func _on_keydoor1_body_entered(_body):
	get_tree().change_scene("res://Keyroom1.tscn")


<<<<<<< HEAD
func _on_Area2D_body_entered(_body):
	get_tree().change_scene("res://Keyroom2.tscn")


func _on_fallzone2_body_entered(_body):
	get_tree().change_scene("res://Level1.tscn")


func _on_leveldoor1_body_entered(_body):
	get_tree().change_scene("res://Level2.tscn")


func _on_leveldoor2_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")


func _on_backdoor1_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")


func _on_backdoor2_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")


func _on_backdoor3_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")


func _on_keydoor3_body_entered(body):
	get_tree().change_scene("res://Keyroom3.tscn")


func _on_goback1_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")



func _on_goback2_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")


func _on_finaldoor_body_entered(body):
	get_tree().change_scene("res://Final Room.tscn")


func _on_leveldoor3_body_entered(body):
	get_tree().change_scene("res://Bossroom.tscn")
=======
>>>>>>> 8941f458b4db2c1e6485ad029b9df709a6a3016f
