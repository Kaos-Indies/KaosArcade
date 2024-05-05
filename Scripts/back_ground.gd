extends ParallaxBackground

@onready var sprite = $ParallaxLayer/Sprite2D
@onready var start_sprite = $ParallaxLayer/Sprite2D2
@export var scroll_speed = 15
@export var bg_texture_1: CompressedTexture2D = preload("res://Assets/BGs/darkPurple.png")
@export var bg_texture_2: CompressedTexture2D = preload("res://Assets/BGs/black.png")
@export var bg_texture_3: CompressedTexture2D = preload("res://Assets/BGs/purple.png")
@export var bg_texture_start: CompressedTexture2D = preload("res://Assets/BGs/rm251-aum-01-a.jpg")
@onready var random_bg = randi_range(1,3)
	
func _ready():
	print(Global.current_scene)
	if (Global.current_scene.get_name() == "StartMenu"):
		start_sprite.texture = bg_texture_start
		self.start_sprite.visible = true
	elif (Global.current_scene.get_name() == "FlappyBirdGame" && random_bg == 1):
		sprite.texture = bg_texture_1
	elif (Global.current_scene.get_name() == "FlappyBirdGame" && random_bg == 2):
		sprite.texture = bg_texture_2
	else:
		sprite.texture = bg_texture_3


func _process(delta):
	if (Global.current_scene.get_name() == "FlappyBirdGame"):
		sprite.region_rect.position += delta*Vector2(scroll_speed,0)
		if sprite.region_rect.position >= Vector2(256,0):
			sprite.region_rect.position = Vector2.ZERO
	if (Global.current_scene.get_name() == "StartMenu"):
		start_sprite.region_rect.position += delta*Vector2(scroll_speed,0)
		if start_sprite.region_rect.position >= Vector2(5000,0):
			start_sprite.region_rect.position = Vector2.ZERO

