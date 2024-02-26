extends Node2D

@onready var score = 0

func _ready():
	$score.text = str(score)


func _on_player_player_took_hit(life):
	$life_label.text = str(life)


func _on_player_player_spawn(life):
	$life_label.text = str(life)
 


func _on_player_player_is_dead():
	$normal_enemy_spawn.queue_free()
	$Player.queue_free()


func _on_normal_enemy_spawn_enemy_spawned(enemy):
	enemy.connect("enemy_die", _on_enemy_die)
	add_child(enemy)

func _on_enemy_die():
	a()
	score += 10
	$score.text = str(score)

func a():
	$explosion.play()
