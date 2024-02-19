extends Area2D

var speed = 400
var direction = Vector2(1,0)

func _ready():
	visible = true
	var sound = $LaserSound
	sound.play()

func _process(delta):
	global_position += direction * speed * delta
	global_rotation = 0


func _on_visible_notifier_screen_exited():
	queue_free()


func _on_area_entered(area):
	area.die()
	queue_free()
