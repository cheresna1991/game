extends Node
class_name Damageable
@export var blockstate : BlockState 
signal on_hit(node : Node, damage_taken : int, knoback_direction : Vector2)

@export var health : float = 40 :
	get:
		return health
	set(value):
		SignalBus.emit_signal('on_health_changed', get_parent(), value - health)
		health = value

func hit(damage : int, knoback_direction : Vector2):
	health -= damage
	#print(blockstate.is_blocked)
	emit_signal('on_hit', get_parent(), damage, knoback_direction)
	if (health <= 0):
		get_parent().queue_free()
