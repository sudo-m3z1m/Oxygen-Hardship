extends Node

class_name StateMachine

@onready var target: Player = get_parent()
@onready var input_handler: InputHandler = get_parent().get_node("InputHandler")

enum States {
	IDLE,
	WALK,
	JUMP,
	SWIM_IDLE,
	SWIM
}

enum PlaceStates {
	UNDERWATER,
	ABOVE_WATER
}

var place_states: Dictionary = {
	PlaceStates.UNDERWATER: preload("res://prefabs/player/state_machine/states/underwater.gd"),
	PlaceStates.ABOVE_WATER: preload("res://prefabs/player/state_machine/states/above_water.gd")
}

var states: Dictionary = {
	States.IDLE: preload("res://prefabs/player/state_machine/states/idle.gd"),
	States.WALK: preload("res://prefabs/player/state_machine/states/walk.gd"),
	States.SWIM_IDLE: preload("res://prefabs/player/state_machine/states/swim_idle.gd"),
	States.SWIM: preload("res://prefabs/player/state_machine/states/swim.gd"),
	States.JUMP: preload("res://prefabs/player/state_machine/states/state.gd"),
}

var current_place_state_index: PlaceStates = PlaceStates.UNDERWATER
var current_place_state: PlaceState
var current_state_index: States
var current_state: DetailedState
var raw_direction: Vector3 = Vector3.ZERO

func _ready() -> void:
	current_place_state = place_states[PlaceStates.UNDERWATER].new(target, self)
	current_state = states[States.SWIM_IDLE].new(target, self, current_place_state)

func _process(delta: float) -> void:
	current_place_state.update_state(delta)
	current_state.update_state(delta)
	
	raw_direction = input_handler.get_moving_input()
	if raw_direction:
		change_state(current_place_state.get_moving_state_index())
		return

	change_state(States.SWIM_IDLE)

func change_state(new_state_index: States) -> void:
	if current_state_index == new_state_index or !current_state.exit_state(new_state_index) or \
	!current_place_state.is_state_valid(new_state_index):
		return
	current_state = states[new_state_index].new(target, self, current_place_state)
	current_state.enter_state()

func set_current_movement_type(new_place_state_index: PlaceStates) -> void:
	if current_place_state_index == new_place_state_index:
		return
	current_place_state = place_states[new_place_state_index].new(target, self)
	current_place_state.enter_state()
