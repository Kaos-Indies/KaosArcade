extends Node2D

signal top_column_spawned(column_instance)
signal bot_column_spawned(column_instance)
@onready var spawn_position = $SpawnPosTop
@onready var timer = $Timer

var speed = 0
var brick_scene = preload("res://Scenes/FlappyBirdGame/brick.tscn")

func _on_timer_timeout():
	spawn_column()
	speed += 5
	
func spawn_column():
	var spawn_position_array = spawn_position.get_children()
	var random_spawn_position = spawn_position_array.pick_random()
	var column_instance = brick_scene.instantiate()
	var random_delay_top = randi_range(2,4)
	
	await get_tree().create_timer(random_delay_top).timeout
	
	column_instance.global_position = random_spawn_position.global_position
	column_instance.update_speed(speed)
	emit_signal("column_spawned", column_instance)

func stop():
	timer.stop()

