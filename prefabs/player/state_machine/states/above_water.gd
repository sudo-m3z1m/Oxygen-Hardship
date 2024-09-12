extends PlaceState

func _init(target: Object, state_machine: StateMachine) -> void:
	super(target, state_machine)

	valid_states_indeces = [StateMachine.States.IDLE, StateMachine.States.WALK,
	StateMachine.States.JUMP]

	max_speed = 10
	acceleration_weight = 0.15
	inertia_weight = 0.1

func enter_state() -> void:
	target.gravity = 10.0

func update_state(delta: float) -> void:
	pass

func exit_state(new_state_index: StateMachine.States) -> bool:
	return true

func get_moving_state_index() -> StateMachine.States:
	return StateMachine.States.WALK
