extends PlayerState

class_name Idle

func Enter():
	player.myAnimationPlayer.play("idle")
	
func Exit():
	pass

func Update(delta:float):
	#transition logic
	if player.velocity.x!=0: #If player is moving horizontally
		if player.is_on_floor():
			Transitioned.emit(self,"run")
			
	if player.velocity.y<0:
		Transitioned.emit(self,"jump")
	
	if player.velocity.y>0:
		Transitioned.emit(self,"fall")
		
	if player.isWallSliding==true:
		Transitioned.emit(self,"wallSlide")
