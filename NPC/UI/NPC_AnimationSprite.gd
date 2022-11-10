extends AnimatedSprite

func change_NPC():
	if NpcTracker.CurrentNPC == "cow":
		self.play(NpcTracker.CurrentNPC)
	if NpcTracker.CurrentNPC == "cat":
		self.play(NpcTracker.CurrentNPC)
	if NpcTracker.CurrentNPC == "wolf":
		self.play(NpcTracker.CurrentNPC)
