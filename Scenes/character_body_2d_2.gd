extends CharacterBody2D

var speed = 200
@onready var player = get_node("../Player")

func _physics_process(delta):
	var direction = position.direction_to(player.position)
	velocity = direction * speed
	move_and_slide()
