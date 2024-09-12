extends State

class_name DetailedState

var place_state: PlaceState

func _init(target: Object, state_machine: StateMachine, place_state: PlaceState) -> void:
	super(target, state_machine)
	self.place_state = place_state

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	pass

func exit_state(new_state_index: StateMachine.States) -> bool:
	return is_state_valid(new_state_index)
