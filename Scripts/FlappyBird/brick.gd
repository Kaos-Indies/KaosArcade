extends Area2D

signal brickVanished
var speed = 300
@onready var visiblenotifier = $VisibleOnScreenNotifier2D

func _ready():
	visiblenotifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.x -= speed*delta

func _on_screen_exited():
	emit_signal("brickVanished")
	queue_free()

func _on_body_entered(body):
	body.on_hit()
	
func update_speed(new_speed):
	self.speed += new_speed
	
