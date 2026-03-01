extends CharacterBody2D

var speed = 200

var damage_amount = 2
@onready var player = get_node("../Player")

func _physics_process(_delta):
	var direction = position.direction_to(player.position)
	velocity = direction * speed
	move_and_slide()

func _on_damage_area_body_entered(body):
	if body.is_in_group("player") or body.name == "Player":
		if body.has_method("take_damage"):
			body.take_damage(damage_amount)
			print("Player hit! HP reduced.")
