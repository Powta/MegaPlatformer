extends Player

class_name DefaultPlayer

func _ready():
	pass

func _physics_process(delta):
	jumpBufferTimer-=delta
	coyoteTimer-=delta
	
	if dir==1:
		$Sprite2D.scale.x=1
	else:
		$Sprite2D.scale.x=-1
		
	movement(delta)
	move_and_slide()

func movement(delta):

	# Add the gravity.
	if not is_on_floor():
		if velocity.y<0:
			velocity.y += gravity * delta
		else:
			velocity.y += gravity*2 * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		jumpBufferTimer=jumpBufferTime
	if jumpBufferTimer>0 and coyoteTimer>0:
		coyoteTimer=0
		jumpBufferTimer=0
		velocity.y=JUMP_VELOCITY
		
	if is_on_floor():
		coyoteTimer=coyoteTime
		
	if Input.is_action_just_released("ui_accept"):
		if velocity.y<0: #Don't half the velocity when you're falling
			velocity.y*=0.25 #Half the vertical velocity when you let go of the jump button	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")

		
	if direction:
		if direction>0:
			dir=1
		else:
			dir=-1
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
