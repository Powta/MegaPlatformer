extends PlayerState

class_name Run

func Enter():
	player.myAnimationPlayer.play("run")
	
func Exit():
	pass

func Update(delta:float):
	if player.velocity.x==0:
		Transitioned.emit(self,"idle")
	
	if player.velocity.y<0:
		Transitioned.emit(self,"jump")
		
	if player.velocity.y>0:
		Transitioned.emit(self,"fall")
	
	if player.isWallSliding==true:
		Transitioned.emit(self,"wallSlide")
