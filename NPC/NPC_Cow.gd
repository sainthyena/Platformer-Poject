extends KinematicBody2D
class_name NPC
onready var is_dead = false
const GRAVITY = 9
onready var motion = Vector2()

func _physics_process(delta):
	if is_dead == false:	
		motion.y += GRAVITY
		motion.x = lerp(motion.x, 0, 0.1)
