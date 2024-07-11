extends Player

class_name DefaultPlayer


func _ready():
	pass

func _physics_process(delta):
	jumpBufferTimer-=delta
	coyoteTimer-=delta
	leftWallTimer-=delta
	rightWallTimer-=delta
	
	if is_on_wall() and Input.is_action_pressed("ui_left"):
		leftWallTimer=leftWallTime
		if not is_on_floor():
			isWallSliding=true
	elif is_on_wall() and Input.is_action_pressed("ui_right"):
		rightWallTimer=rightWallTime
		if not is_on_floor():
			isWallSliding=true
	else:
		isWallSliding=false
		
	if dir==1:
		$Sprite2D.scale.x=1
	else:
		$Sprite2D.scale.x=-1

	wallSlide(delta)	
	movement(delta)
	move_and_slide()

func movement(delta):
	# Add the gravity.
	if not is_on_floor():
		if isWallSliding:
			if velocity.y<0:
				velocity.y= move_toward(velocity.y,0,20)
			else:
				velocity.y+=wallSlideGravity*delta
				velocity.y=min(gravity,wallSlideGravity)
		else:
			if velocity.y<0:
				velocity.y += gravity * delta
			else:
				velocity.y += gravity*1.5 * delta
	jump()
	if is_on_floor():
		coyoteTimer=coyoteTime

	if Input.is_action_just_released("ui_accept"):
		if velocity.y<0: #Don't half the velocity when you're falling
			velocity.y*=0.25 #Half the vertical velocity when you let go of the jump button	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
		
	if direction:
		if direction>0:
			dir=1
		else:
			dir=-1
		velocity.x=move_toward(velocity.x, direction * SPEED, 36)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

func jump():
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		jumpBufferTimer=jumpBufferTime
		
		if leftWallTimer>0:
			leftWallTimer=0
			mySoundEffect.play()
			velocity.y=JUMP_VELOCITY
			velocity.x=wallPushBack
			
		if rightWallTimer>0:
			rightWallTimer=0
			mySoundEffect.play()
			velocity.y=JUMP_VELOCITY
			velocity.x=-wallPushBack
		
	if jumpBufferTimer>0 and coyoteTimer>0:
		coyoteTimer=0
		jumpBufferTimer=0
		mySoundEffect.play()
		velocity.y=JUMP_VELOCITY

func wallSlide(delta):
	pass

