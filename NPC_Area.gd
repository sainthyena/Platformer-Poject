extends Area2D
class_name NPC

func _on_NPC_Area_area_entered(area):
	if Player and Input.is_action_just_pressed("ui_accept"):
		print ("aa")
#		NpcAnimationPlayer.check_NPC()
#		NpcAnimationPlayer.visible = true
