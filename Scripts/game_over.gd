extends PanelContainer

func _on_button_pressed():
	Global.goto_scene("res://Scenes/start_menu.tscn")
	

	
func set_score(new_score, new_high_score):
	$Score.text = "Score: " + str(new_score)
	$HighScore.text = "High Score " + str(new_high_score)


func _on_retry_button_pressed():
	Global.goto_scene("res://Scenes/FlappyBirdGame/flappy_bird_game.tscn")
