extends RichTextLabel

func _physics_process(delta):
	self.text = NpcTracker.CurrentNPC
