extends KinematicBody2D
#class_name Player

onready var sprite = $Sprite

var jump_time = 0
var jump_accel = 0
var jump_forgiveness_time = 0
var jump_force = Vector2.ZERO
var jump_count = 4
var can_jump = true
var direction_input = Vector2.ZERO
var direction = Vector2.ZERO

var is_dead = false

signal taking_damage

#func _ready():
#	$AnimationTree.active = true
	
func _physics_process(delta):
	
	if is_dead == false:	
		
		direction_input = Vector2.ZERO
		if !$Floor_Check.is_colliding():
			if Input.is_action_pressed("ui_left"):
				sprite.flip_h = true
				direction_input.x = -2
			if Input.is_action_pressed("ui_left"):
				direction_input.x = 2
				sprite.flip_h = false

		if Input.is_action_pressed("ui_left"):
			direction_input.x = -1
			sprite.flip_h = true
		if Input.is_action_pressed("ui_right"):
			direction_input.x = 1
			sprite.flip_h = false
		#### JUMP ####
		if jump_time <= Constants.MAX_JUMP_TIME or jump_forgiveness_time <= Constants.MAX_JUMP_FORGIVENESS_TIME and jump_count > 0:
			if Input.is_action_pressed("ui_up"):
				jump_accel = -Constants.MAX_JUMP
				jump_count -= 1
				can_jump = !can_jump
			
		if Input.is_action_pressed("ui_up") and jump_count > 0 and can_jump:
			jump_accel -= Constants.MAX_JUMP * delta
			jump_force.y = jump_accel
			jump_count -= 1
			can_jump = !can_jump
		
		##MOVEMENT##
		if direction_input == Vector2.ZERO:
			direction = direction.linear_interpolate(Vector2.ZERO, delta/Constants.HALT_SPEED)
		else:
			direction = direction.linear_interpolate(direction_input * Constants.MAX_SPEED, delta)
		
		move_and_slide(direction + jump_force, Vector2.UP)
		
		
		
		if is_on_floor():
			jump_accel = 0.0
			jump_force.y = 0.0
			jump_forgiveness_time = 0.0
			jump_count = 4
			
		else:
			if !Input.is_action_pressed("ui_up"):
				jump_time = Constants.MAX_JUMP_TIME + 1
			else:
				jump_forgiveness_time = Constants.MAX_JUMP_FORGIVENESS_TIME + 1
			jump_time += delta
			jump_forgiveness_time += delta
			jump_force.y += Constants.GRAVITY * delta
			
		if is_on_floor() or (jump_forgiveness_time <= Constants.MAX_JUMP_FORGIVENESS_TIME):
			jump_time = 0.0
		if $Ceiling_Check.is_colliding() or $Ceiling_Check2.is_colliding() or $Ceiling_Check3.is_colliding():
			jump_force.y = -jump_accel/4
			
		
				
	
func damage():	
	
	print(Globals.player_health)
	
	if Globals.player_health == 1:
		dead()

	else:
		#$AnimationPlayer.play("TakingDamage")
		Globals.player_health -= 1
		emit_signal("taking_damage")

func dead():
	is_dead = true
	#direction = Vector2(0, 0)
	self.translate(Vector2(0, -10))

	$Timer.start()	
	Globals.enemy_kill_count = 0


func _on_Timer_timeout():
	get_tree().change_scene("res://Screens/TitleScreen.tscn")

pass # Replace with function body.
