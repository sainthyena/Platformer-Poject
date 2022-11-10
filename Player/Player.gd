extends KinematicBody2D
class_name Player

const GRAVITY = 9
const SPEED = 20
const MAX_SPEED = 400
const JUMP_HEIGHT = 300
onready var sprite = $Sprite

var motion = Vector2();
var is_dead = false;

onready var jump_count = 2

signal taking_damage



func _physics_process(delta):
	
	if is_dead == false:	
		motion.y += GRAVITY
		
		
		if Input.is_action_pressed("ui_right"):		
			
			if !is_on_floor():
				sprite.play("walk_air")
				sprite.flip_h = false
				motion.x += SPEED
			if is_on_floor():
				sprite.play("walk_floor")
				sprite.flip_h = false
				motion.x += SPEED
		elif Input.is_action_pressed("ui_left"):
			
			if !is_on_floor():
				sprite.play("walk_air")
				sprite.flip_h = true
				motion.x -= SPEED
			if is_on_floor():
				sprite.play("walk_floor")
				sprite.flip_h = true
				motion.x -= SPEED
		else:
			motion.x = lerp(motion.x, 0, 0.1)		
			if motion.y < GRAVITY:
				if !is_on_floor():
					sprite.play("jump")
			if motion.y > GRAVITY:
				if !is_on_floor():
					sprite.play("air")		
			if int(motion.y) == int(GRAVITY):
				
				sprite.play("idle")
#
		if motion.x > MAX_SPEED:
			motion.x = MAX_SPEED
		if motion.x < -MAX_SPEED:
			motion.x = -MAX_SPEED		
#
		
		if jump_count == 2:
			if Input.is_action_just_pressed("ui_up"):
				jump_count -= 1
				motion.y -= JUMP_HEIGHT + GRAVITY
				if !is_on_floor():
					sprite.play("jump")
		if jump_count == 1:
			if Input.is_action_just_pressed("ui_up"):
				jump_count -= 1
				motion.y -= JUMP_HEIGHT + GRAVITY
				if !is_on_floor():
					sprite.play("jump")
		if is_on_floor():
			jump_count = 2

		motion = move_and_slide(motion, Vector2.UP); 
		
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
	motion = Vector2(0, 0)
	self.translate(Vector2(0, -10))
		
	$Timer.start()	
	Globals.enemy_kill_count = 0


func _on_Timer_timeout():
	get_tree().quit()
	#get_tree().change_scene("res://TitleScreen.tscn")
