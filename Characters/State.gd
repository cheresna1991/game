extends Node

class_name State

@export var can_move : bool = true
var character : CharacterBody2D
var next_state : State
var playback : AnimationNodeStateMachinePlayback

signal interrupt_state(new_state : State)
func state_input(event : InputEvent):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func state_process(delta):
	pass

func on_enter():
	pass
func on_exit():
	pass
