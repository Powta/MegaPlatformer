extends PlayerState

class_name wallSlide

func Enter():
	player.myAnimationPlayer.play("wallSlide")
	
func Exit():
	pass

func Update(delta:float):
	if player.isWallSliding==false:
		Transitioned.emit(self,"idle")
	
