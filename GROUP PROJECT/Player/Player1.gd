extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
const ACCELERATION = 512
const MAX_SPEED = 300
const FRICTION = 0.25 
const AIR_RESISTANCE = 0.02
const GRAVITY = 500
const JUMP_FORCE = 505
var player1 = "Player1"
var motion = Vector2.ZERO
var Player1keys = Global.Player1keys



	
	
func _physics_process(_delta):
	var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	if x_input != 0:
		_animated_sprite.play("Walk")
		motion.x += x_input * ACCELERATION * _delta
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
	else:
		_animated_sprite.play("Stand")
	if Input.is_action_just_pressed("left"):
		$AnimatedSprite.flip_h = true
	if Input.is_action_just_pressed("right"):
		$AnimatedSprite.flip_h = false
	Player1keys = min(Player1keys,3)
	motion.y += GRAVITY * _delta 
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION)
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMP_FORCE
	else:
		if Input.is_action_just_released("jump") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
			
		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE)
	motion = move_and_slide(motion, Vector2.UP)
	
	







	


func _on_leveldoor1_body_entered(body):
	get_tree().change_scene("res://Level2.tscn")



func _on_keydoor1_body_entered(body):
	get_tree().change_scene("res://Keyroom1.tscn")


func _on_leveldoor2_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")


func _on_keydoor2_body_entered(body):
	get_tree().change_scene("res://Keyroom2.tscn")


func _on_leveldoor3_body_entered(body):
	get_tree().change_scene("res://Bossroom.tscn")


func _on_keydoor3_body_entered(body):
	get_tree().change_scene("res://Keyroom3.tscn")


func _on_backdoor1_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")


func _on_backdoor2_body_entered(body):
	get_tree().change_scene("res://Level2.tscn")


func _on_backdoor3_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")


func _on_finaldoor_body_entered(body):
	get_tree().change_scene("res://Final Room.tscn")


func _on_goback1_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")


func _on_goback2_body_entered(body):
	get_tree().change_scene("res://Bossroom.tscn")




	


func _on_level3door_body_entered(body):
	if body.name == "Player1":
		get_tree().change_scene("res://Bossroom.tscn")
