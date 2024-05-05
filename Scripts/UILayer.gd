extends CanvasLayer

var startPanel = preload("res://Scenes/start_panel.tscn")
var gameOver = preload("res://Scenes/game_over.tscn")


func _ready():
	if (Global.current_scene.get_name() == "StartMenu"):
		add_child(startPanel.instantiate())
