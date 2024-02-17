extends Area2D

var speed = 400
var direction = Vector2(1,0)
#var global_initial_rotation = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += direction * speed * delta
	global_rotation = 0
