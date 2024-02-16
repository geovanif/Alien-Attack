extends CharacterBody2D


const SPEED = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity = Vector2(0,0)
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_y:
		velocity.y = direction_y * SPEED
		
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		
	var screen_size = get_viewport_rect().size
#	position.x = clamp(position.x, 50, screen_size.x-50)
#	position.y = clamp(position.y, 50, screen_size.y-50)
	position = position.clamp(Vector2(50,50), screen_size - Vector2(50,50))
	move_and_slide()
