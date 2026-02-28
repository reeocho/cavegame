extends CharacterBody2D

var up = preload("res://images/IMG_0060.PNG_scaled_8x_pngcrushed.png")
var right = preload("res://images/IMG_0061.PNG_scaled_8x_pngcrushed.png")
var down = preload("res://images/IMG_0059.PNG_scaled_8x_pngcrushed.png")
var leftside = preload("res://images/leftside.png")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if Input.is_action_just_pressed("ui_right"):
			$Sprite2D.texture = right
		if Input.is_action_just_pressed("ui_left"):
			$Sprite2D.texture = leftside
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var y_axis := Input.get_axis("ui_up", "ui_down")
	if y_axis:
		velocity.y = y_axis * SPEED
		if Input.is_action_just_pressed("ui_up"):
			$Sprite2D.texture = up
		if Input.is_action_just_pressed("ui_down"):
			$Sprite2D.texture = down
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)


	move_and_slide()
