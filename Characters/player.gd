extends CharacterBody2D

class_name Player
@export var player_index : int = 0
@export var speed : float = 150.0
@export var hit_state : State
@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

signal facing_direction_changed(facing_right : bool)

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	#is_joy_button_pressed
	if player_index == 0:
		direction.x = Input.get_joy_axis(player_index, JOY_AXIS_LEFT_X )
	elif player_index == 1:
		direction = Input.get_vector("left_%s" % [player_index], "right_%s" % [player_index], 'up', 'down')

	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation_parameters()
	update_facing_direction()
	
	
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
	emit_signal('facing_direction_changed', !sprite.flip_h)
