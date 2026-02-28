extends Area2D

var is_reachable: bool = false

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Player": 
		is_reachable = true
		print("Player entered interaction range.")

func _on_body_exited(body: CharacterBody2D) -> void:
	if body.name == "Player":
		is_reachable = false
		print("Player exited interaction range.")

func _process(_delta: float) -> void:
	if is_reachable and Input.is_action_just_pressed("Interact"):
		print("Interacted!")
