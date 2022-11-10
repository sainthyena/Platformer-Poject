extends Node2D


func _on_NPCButtonCAT_pressed():
	NpcTracker.CurrentNPC = "cat"
	changeNPC()

func _on_NPCButtonCOW_pressed():
	NpcTracker.CurrentNPC = "cow"
	changeNPC()

func _on_NPCButtonWOLF_pressed():
	NpcTracker.CurrentNPC = "wolf"
	changeNPC()
	
func changeNPC():
	NpcAnimationPlayer.check_NPC()
	NpcAnimationPlayer.visible = true
