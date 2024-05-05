extends Node2D

var gameover_scene = preload("res://Scenes/game_over.tscn")
var hud = preload("res://Scenes/FlappyBirdGame/hud.tscn")
var score = 0
var high_score = Global.fbg_HighScore
@onready var player = $FlappyBirdGameCharacter
@onready var ui = $UILayer
@onready var column = $Column
@onready var hud_instance = hud.instantiate()

func _ready():
	ui.add_child(hud_instance)
	hud_instance.set_score(score, high_score)
	

func _on_column_column_spawned(column_instance):
	add_child(column_instance)
	column_instance.connect("brickVanished",_on_brick_vanished)
 
func _on_brick_vanished():
	score += 1
	hud_instance.set_score(score, high_score)

func _game_over():
	player.die()
	ui.remove_child(hud_instance)
	column.stop()
	if (score > high_score):
		Global.fbg_HighScore = score
	await get_tree().create_timer(1.5).timeout
	
	var instance_gameover = gameover_scene.instantiate()
	ui.add_child(instance_gameover)
	instance_gameover.set_score(score, high_score)
	

func _on_flappy_bird_game_character_hit():
	_game_over()
