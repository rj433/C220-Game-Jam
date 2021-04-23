extends KinematicBody2D

const ACCELERATION = 512
const MAX_SPEED = 64
const FRICTION = 0.25 
const GRAVITY = 200
const JUMP_FORCE = 128

var motion = Vector2.ZERO


func _physics_process(_delta):
	var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	
	
	
	motion.y += GRAVITY * _delta 
	
	move_and_slide(motion)
	
	
