extends DetailedState

var direction: Vector3

func _init(target: Object, state_machine: StateMachine, place_state: PlaceState) -> void:
	super(target, state_machine, place_state)

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	target.velocity = lerp(target.velocity, Vector3.ZERO, place_state.inertia_weight)
	
	target.move_and_slide()

func exit_state(new_state_index: StateMachine.States) -> bool:
	return is_state_valid(new_state_index)
