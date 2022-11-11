extends KinematicBody2D
class_name Player
onready var is_dead = false
var velocity = Vector2.ZERO
var Hang_time = 1

func _physics_process(delta):
	if is_dead == false:
		velocity.y += 20
		input()
		velocity = move_and_slide(velocity)
		if $Floor_Check.is_colliding() or $Floor_Check2.is_colliding() or $Floor_Check3.is_colliding():
			Constants.JUMP_TIME = 3
			Hang_time = 1

func input():
	if Input.is_action_pressed("ui_left"):
		velocity.x = -Constants.SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = Constants.SPEED
	else:
		velocity.x = 0
	
	
			
	if Input.is_action_pressed("jump"):
		if $Floor_Check.is_colliding() or $Floor_Check2.is_colliding() or $Floor_Check3.is_colliding() :
			velocity.y = Constants.MAX_JUMP_HEIGHT
			Constants.JUMP_ACCELERATION = Constants.GRAVITY/6
			
		
	if Input.is_action_pressed("jump"):
		if Constants.JUMP_TIME > 0:
			velocity.y += -Constants.JUMP_ACCELERATION - Constants.GRAVITY
			Constants.JUMP_TIME -= 1 
			
		if Constants.JUMP_TIME == 0  and Hang_time > 0:
			velocity.y += -Constants.GRAVITY*0.2
			Hang_time -= 1
			
	if Input.is_action_just_released("jump"):
		Constants.JUMP_TIME = 0
		Hang_time = 0
		velocity.y += Constants.GRAVITY
