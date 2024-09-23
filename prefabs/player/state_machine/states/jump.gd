extends DetailedState

var jump_strength: float = 5

func _init(target: Object, state_machine: StateMachine, place_state: PlaceState) -> void:
	super(target, state_machine, place_state)

func enter_state() -> void:
	target.velocity.y = jump_strength

func update_state(delta: float) -> void:
	target.move_and_slide()

func exit_state(new_state_index: StateMachine.States) -> bool:
	return is_state_valid(new_state_index)
