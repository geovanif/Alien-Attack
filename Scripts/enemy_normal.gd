extends Area2D

signal enemy_die

var speed = 300
var direction = Vector2(-1,0)


func _process(delta):
	global_position += direction * speed * delta

	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func die():
	emit_signal("enemy_die")
	queue_free()



func _on_body_entered(body):
	if body.name == 'Player':
		body.hit()
		$audio_hit.play()
