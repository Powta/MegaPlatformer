extends CharacterBody2D

class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

#Jump buffer variables
@export var jumpBufferTime:float
var jumpBufferTimer=0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	jumpBufferTimer-=delta
	# Add the gravity.
	if not is_on_floor():
		if velocity.y<0:
			velocity.y += gravity * delta
		else:
			velocity.y += gravity*2 * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		jumpBufferTimer=jumpBufferTime
	if jumpBufferTimer>0:
		if is_on_floor():
			jumpBufferTimer=0
			velocity.y=JUMP_VELOCITY
	if is_on_floor():
		pass
	if Input.is_action_just_released("ui_accept"):
		if velocity.y<0: #Don't half the velocity when you're falling
			velocity.y*=0.25 #Half the vertical velocity when you let go of the jump button	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
