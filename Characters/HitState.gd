extends State
class_name HitState

@export var damageable : Damageable 
@export var dead_state : State
@export var air_state : State
@export var dead_animation_node : String = 'dead'
@export var knockback_speed : float = 100.0
@export var return_state : State
@onready var timer : Timer = $Timer


func _ready():
	damageable.connect('on_hit', on_damageable_hit)

func on_enter():
	timer.start()
func on_exit():
	character.velocity = Vector2.ZERO

func on_damageable_hit(node : Node, damage_amount : int, knoback_direction : Vector2):
	if (damageable.health > 0):
		character.velocity = knockback_speed * knoback_direction
		character.velocity.y = -200.0

		emit_signal('interrupt_state', self)
		#self instead return_state
	else:
		emit_signal('interrupt_state', dead_state)
		#playback.travel(dead_animation_node)


func _on_timer_timeout():
	next_state = return_state
