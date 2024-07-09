extends CharacterBody2D

class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -360.0

#Components
@export var myAnimationPlayer:AnimationPlayer

var dir=1

#Jump buffer variables
@export var jumpBufferTime:float
@export var coyoteTime:float
var jumpBufferTimer=0
var coyoteTimer=0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	pass
