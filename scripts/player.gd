
extends KinematicBody2D

export(float) var speed = 300
export(float) var acceleration = 5

var direction = Vector2()
var move_right
var move_left
var move_up
var move_down
var motion
var is_alive

func _ready():
	is_alive = true
	set_fixed_process(true)


func _fixed_process(delta):
	move_right = Input.is_action_pressed("move_right")
	move_left = Input.is_action_pressed("move_left")
	move_up = Input.is_action_pressed("move_up")
	move_down = Input.is_action_pressed("move_down")
	
	direction = Vector2()
	
	if move_right and not move_left:
		direction.x = 1
	elif move_left and not move_right:
		direction.x = -1
		
	if move_down and not move_up:
		direction.y = 1
	elif move_up and not move_down:
		direction.y = -1
	
	motion = direction.normalized() * speed * acceleration * delta
	move(motion)


