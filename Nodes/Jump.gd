extends PlayerState

class_name Jump

func Enter():
	
	player.myAnimationPlayer.play("jump")
	
func Exit():
	pass

func Update(delta:float):
	if player.is_on_floor():
		Transitioned.emit(self,"idle")
		
	if player.velocity.y>0:
		Transitioned.emit(self,"fall")
		
	if player.isWallSliding==true:
		Transitioned.emit(self,"wallSlide")
