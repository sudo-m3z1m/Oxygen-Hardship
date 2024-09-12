extends State

class_name PlaceState

var inertia_weight: float
var acceleration_weight: float
var max_speed: float

func _init(target: Object, state_machine: StateMachine) -> void:
	super(target, state_machine)

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	pass

func exit_state(new_state_index: StateMachine.States) -> bool:
	return true

func get_moving_state_index() -> StateMachine.States:
	return StateMachine.States.SWIM
