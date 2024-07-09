extends State

class_name Idle

@export var player:Player

func Enter():
	
	player.myAnimationPlayer.play("idle")
	
func Exit():
	pass

func Update(delta:float):
	pass
