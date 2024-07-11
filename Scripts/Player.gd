extends CharacterBody2D

class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -360.0
var wallPushBack= 400.0

var direction
var isWallSliding=false

#Components
@export var myAnimationPlayer:AnimationPlayer
@export var mySoundEffect:AudioStreamPlayer
var dir=1

#Jump buffer variables
@export var jumpBufferTime:float
@export var coyoteTime:float
@export var leftWallTime:float
@export var rightWallTime:float
var jumpBufferTimer=0
var coyoteTimer=0
var leftWallTimer=0
var rightWallTimer=0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var wallSlideGravity=80

func _ready():
	pass

func _physics_process(delta):
	pass
