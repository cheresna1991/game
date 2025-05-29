extends State

class_name BlockState

@export var player : Player
@export var return_state : State
@export var return_animation_node : String = 'move'
@export var block_name : String = 'block'
var is_blocked : bool = false

#signal on_hit(node : Node, damage_taken : int, knoback_direction : Vector2)
#emit_signal('on_hit', get_parent(), damage, knoback_direction)
#signal on_block(node : Node, is_blocked : bool)

func on_enter():
	is_blocked = true

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == block_name):
		next_state = return_state
		playback.travel(return_animation_node)
		is_blocked = false
		
