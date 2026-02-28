extends Area2D

var is_reachable: bool = false

func _on_body_entered(body: Node2D) -> void:
	# Check if the entering body is the player (you might need a group or specific naming for this check)
	if body.name == "Player": 
		is_reachable = true
		print("Player entered interaction range.")

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		is_reachable = false
		print("Player exited interaction range.")

func _process(_delta: float) -> void:
	if is_reachable and Input.is_action_just_pressed("interact"):
		print("Interacted!")
		# Add the specific action here (e.g., open a chest, start dialogue)
		# Example: start_dialogue() 
