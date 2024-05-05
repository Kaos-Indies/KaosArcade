extends PanelContainer

signal scene_change_fbg
#fbg start button
func _on_button_pressed():
	Global.goto_scene("res://Scenes/FlappyBirdGame/flappy_bird_game.tscn")
