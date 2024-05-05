extends PanelContainer

func set_score(new_score, high_score):
	$Score.text = "Score: " + str(new_score) + " High Score: " + str(high_score)
