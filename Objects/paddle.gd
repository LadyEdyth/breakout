extends RigidBody2D

class_name Paddle

var direction = Vector2.ZERO
var camera_rect : Rect2
var half_paddle_width : float

@export var speed = 300
@export var camera : Camera2D

@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	camera_rect = camera.get_viewport_rect()
	half_paddle_width = collision_shape_2d.shape.get_rect().size.x / 2
		
func _physics_process(delta):
	linear_velocity = speed * direction
	
func _process(delta):
	var camera_start_x = camera.position.x - camera_rect.size.x / 2
	var camera_end_x = camera_start_x + camera_rect.size.x
	
	if global_position.x - half_paddle_width < camera_start_x:
		global_position.x = camera_start_x + half_paddle_width
	elif global_position.x + half_paddle_width > camera_end_x:
		global_position.x = camera_end_x - half_paddle_width
	
func _input(event):
	if Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO
