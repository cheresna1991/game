extends State

class_name GroundState
@export var player : Player
@export var jump_velocity : float = -200.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack_state : State
@export var attack_node : String = "attack1"
@export var block_state : State
@export var block_node : String = "block"


@onready var buffer_timer : Timer = $BufferTimer

func _ready():
	pass # Replace with function body.

func state_process(delta):
	if (!character.is_on_floor() && buffer_timer.is_stopped()):
		next_state = air_state


func state_input(event : InputEvent):
	if (event.is_action_pressed("jump_%s" % [player.player_index])):
		jump()
	if (event.is_action_pressed("attack_%s" % [player.player_index])):
		attack()
	if (event.is_action_pressed("block_%s" % [player.player_index])):
		block()

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
	
func attack():
	next_state = attack_state
	playback.travel(attack_node)
	
func block():
	next_state = block_state
	playback.travel(block_node)
