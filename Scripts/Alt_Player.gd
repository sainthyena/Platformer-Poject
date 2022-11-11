extends Node

func _ready():
	pass
#		motion.y += Constants.GRAVITY
#
### MOVEMENT INPUT ##
#		if Input.is_action_pressed("ui_right"):		
#			if !is_on_floor():
#				sprite.play("walk_air")
#				sprite.flip_h = false
#				motion.x += Constants.SPEED
#			if is_on_floor():
#				sprite.play("walk_floor")
#				sprite.flip_h = false
#				motion.x += Constants.SPEED
#
#		elif Input.is_action_pressed("ui_left"):
#			if !is_on_floor():
#				sprite.play("walk_air")
#				sprite.flip_h = true
#				motion.x -= Constants.SPEED
#			if is_on_floor():
#				sprite.play("walk_floor")
#				sprite.flip_h = true
#				motion.x -= Constants.SPEED
#
### AIR ANIMATION ##
#		else:
#			motion.x = lerp(motion.x, 0, 0.1)		
#			if motion.y < Constants.GRAVITY:
#				if !is_on_floor():
#					sprite.play("jump")
#			if motion.y > Constants.GRAVITY:
#				if !is_on_floor():
#					sprite.play("air")		
#			if int(motion.y) == int(Constants.GRAVITY):
#				sprite.play("idle")
#
### SPEED CAP ##
#		if motion.x > Constants.MAX_SPEED:
#			motion.x = Constants.MAX_SPEED
#		if motion.x < -Constants.MAX_SPEED:
#			motion.x = -Constants.MAX_SPEED		
#
### JUMP AND DOUBLE JUMP ##
#		if jump_count == 2:
#			if Input.is_action_just_pressed("ui_up"):
#				jump_count -= 1
#				motion.y -= Constants.JUMP_HEIGHT
#				if !is_on_floor():
#					sprite.play("jump")
#		if jump_count == 1:
#			if Input.is_action_just_pressed("ui_up"):
#				jump_count -= 1
#				motion.y = -Constants.JUMP_HEIGHT
#				if !is_on_floor():
#					sprite.play("jump")
#		if is_on_floor():
#			jump_count = 2
#
#		motion = move_and_slide(motion, Vector2.UP); 
