extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_exited(body):
#	body.position.x = 100.0
#	body.x = 100.0
#	body.y = -100.0
#	body.position = teleport.position
	body.position = Vector2(100.0, -200.0)
