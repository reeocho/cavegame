extends CharacterBody2D

@onready var _animation_player = $Movement

const SPEED = 50.0

func _physics_process(delta: float) -> void:
	var current := "right"
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var y_axis := Input.get_axis("ui_up", "ui_down")
	if y_axis:
		velocity.y = y_axis * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("right")
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("left")
	elif Input.is_action_pressed("ui_up"):
		_animation_player.play("up")
	elif Input.is_action_pressed("ui_down"):
		_animation_player.play("down")
	else:
		_animation_player.stop()


	move_and_slide()
