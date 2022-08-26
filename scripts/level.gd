
extends Node2D

var enemy_scene = preload("res://prefabs/enemy.tscn")

onready var player = get_node("player")
onready var label = get_node("board/label")

var spawn_y = - 32
var spwan_x
var enemies
export(float) var speed = 500

func _ready():
	set_process(true)

func _process(delta):
	enemies = get_tree().get_nodes_in_group("enemy")
	if not player.is_alive:
		get_tree().reload_current_scene()
	for enemy in enemies:
		enemy.speed = speed
	

func _on_visibility_exit_screen():
	get_tree().reload_current_scene()


func _on_Timer_timeout():
	randomize()
	var enemy = enemy_scene.instance()
	spwan_x = rand_range(18, 1005)
	enemy.set_pos(Vector2(spwan_x, spawn_y))
	add_child(enemy)
	speed = speed + 10
