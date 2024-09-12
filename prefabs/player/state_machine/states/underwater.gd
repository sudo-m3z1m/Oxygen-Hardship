extends PlaceState

func _init(target: Object, state_machine: StateMachine) -> void:
	super(target, state_machine)
	
	valid_states_indeces = [StateMachine.States.SWIM_IDLE, StateMachine.States.SWIM]
	
	max_speed = 5
	acceleration_weight = 0.05
	inertia_weight = 0.15

func enter_state() -> void:
	target.gravity = 0
	state_machine.change_state(StateMachine.States.SWIM_IDLE)

func update_state(delta: float) -> void:
	pass

func exit_state(new_state_index: StateMachine.States) -> bool:
	return true
