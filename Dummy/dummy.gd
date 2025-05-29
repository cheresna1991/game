extends CharacterBody2D



@export var SPEED = 30.0

@onready var animation_tree : AnimationTree = $AnimationTree
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var starting_move_direction : Vector2 = Vector2.LEFT
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@export var hit_state : State
@onready var sprite : Sprite2D = $Sprite2D
var direction : Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.

	#direction = Input.get_vector("left", "right", "up", "down")
	direction = starting_move_direction
	if direction && state_machine.check_if_can_move():
		velocity.x = direction.x * SPEED
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	update_facing_direction()
	move_and_slide()
	
func 	update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
