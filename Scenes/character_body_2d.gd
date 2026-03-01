extends CharacterBody2D
var speed = 100
var direction = Vector2.ZERO
func _ready():
	pick_new_direction()
func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
func pick_new_direction():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
