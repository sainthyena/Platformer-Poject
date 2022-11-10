extends Area2D
 

func _on_Cow_Area_area_entered(area):
	if Player:
		NpcTracker.CurrentNPC = "cow"
