extends Area2D
onready var is_npc_entered = false 
 
func _on_Player_Area_area_entered(area):
	if NPC:
		is_npc_entered = true

func _process(delta):
	if is_npc_entered:
		if Input.is_action_just_pressed("ui_accept"):
			is_npc_entered = false
			NpcAnimationPlayer.check_NPC()
			NpcAnimationPlayer.visible = true
