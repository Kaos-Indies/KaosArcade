extends CharacterBody2D

signal hit
@export var boost = 150
@export var gravity = 350

func _physics_process(delta):
	if Input.is_action_just_pressed("boost"):
		velocity.y = -boost
		$Sprite2D/GPUParticles2D.emitting = true
	else:
		velocity.y += gravity * delta
		$Sprite2D/GPUParticles2D.emitting = false
		
	move_and_slide()
	var screensize = get_viewport_rect().size
	if (global_position.y > screensize.y):
		on_hit()
	#global_position = global_position.clamp(Vector2(0,0),screensize)

func on_hit():
	emit_signal("hit")
	print("hit")

func die():
	queue_free()
