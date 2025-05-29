extends State

class_name AirState
@export var player : Player
@export var landing_state: State
@export var double_jump_velocity : float = -200.0
@export var double_jump_animation : String = "double_jump"
@export var landing_animation_name : String = "jump_end"

var has_double_jumped = false
func _ready():
	pass # Replace with function body.

func state_input(event : InputEvent):
	if (event.is_action_pressed("jump_%s" % [player.player_index]) && !has_double_jumped):
		double_jump()

func double_jump():
	character.velocity.y = double_jump_velocity
	playback.travel(double_jump_animation)
	has_double_jumped = true

func on_exit():
	if (next_state == landing_state):
		playback.travel(landing_animation_name)
		has_double_jumped = false

func state_process(delta):
	if (character.is_on_floor()):
		next_state = landing_state
