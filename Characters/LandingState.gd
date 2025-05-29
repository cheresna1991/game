extends State

class_name LandingState

@export var landing_animation_name : String = "jump_end"
@export var ground_state : State
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == landing_animation_name):
		next_state = ground_state
