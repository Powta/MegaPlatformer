extends PlayerState

class_name Fall

func Enter():
	player.myAnimationPlayer.play("fall")
	
func Exit():
	pass

func Update(delta:float):
	if player.is_on_floor():
		Transitioned.emit(self,"idle")
	
	if player.isWallSliding==true:
		Transitioned.emit(self,"wallSlide")

