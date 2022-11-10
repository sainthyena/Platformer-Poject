extends CanvasLayer
onready var AnimPlayer = $NPC_AnimationSprite 
onready var AnimVisible = false

func check_NPC():
		AnimPlayer.animation = NpcTracker.CurrentNPC
		AnimVisible = true
		get_tree().paused = true
		 
		
func _physics_process(delta):
	if AnimVisible and Input.is_action_just_pressed("skip"):
		self.visible = false
		get_tree().paused = false
		AnimVisible = false
