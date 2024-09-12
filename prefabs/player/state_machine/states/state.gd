extends RefCounted

class_name State

var valid_states_indeces: Array[StateMachine.States]

var state_machine: StateMachine
var target: Object

func _init(target: Object, state_machine: StateMachine) -> void:
	self.state_machine = state_machine
	self.target = target

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	pass

func exit_state(new_state_index: StateMachine.States) -> bool:
	return true

func is_state_valid(new_state_index: StateMachine.States) -> bool:
	if valid_states_indeces.is_empty():
		return true
	
	for state_index in valid_states_indeces:
		if state_index == new_state_index:
			return true
	return false
