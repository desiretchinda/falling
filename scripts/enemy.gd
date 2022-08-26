
extends RigidBody2D

export(float) var speed = 300
export(float) var acceleration = 5

var velocity

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity = speed * acceleration * delta
	
	set_axis_velocity(Vector2(0, velocity))

func _on_enemy_body_enter( body ):
	if body.get_name() == "player":
		body.is_alive = false
