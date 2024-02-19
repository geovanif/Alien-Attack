extends Node2D

var enemy_scene = preload("res://Scenes/enemy_normal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if randf() < 0.01:  # Adjust the probability as needed
#		spawn_enemy()


func spawn_enemy():
	print('spanwed')
	var enemy = enemy_scene.instantiate()
	
	var game = get_parent()
	var screen_size = game.get_viewport_rect().size
	var spawn_y = int(randf_range(20, screen_size.y-20)) # Adjust the range as needed
	var spawn_x = screen_size.x +50  #randf_range(0, screen_size.y)  # Random Y coordinate

	enemy.global_position = Vector2(spawn_x, spawn_y)
	game.add_child(enemy)


func _on_timer_timeout():
	spawn_enemy()
