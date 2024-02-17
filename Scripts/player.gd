extends CharacterBody2D


const SPEED = 500.0
var projectile_scene = preload("res://Scenes/projectile.tscn")
@onready var timer = $shoot_coldown

func _physics_process(delta):
	velocity = Vector2(0,0)
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_y:
		velocity.y = direction_y * SPEED
		
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		
	var screen_size = get_viewport_rect().size
	position = position.clamp(Vector2(50,50), screen_size - Vector2(50,50))
	move_and_slide()


func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
func shoot():
	if timer.is_stopped():
		timer.start()
		var projectile = projectile_scene.instantiate()
		var shoot_position = position
		projectile.global_position = shoot_position
		$projectile_box.add_child(projectile)
		
