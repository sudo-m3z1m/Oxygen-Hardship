extends DetailedState

var direction: Vector3
var velocity: Vector3

func _init(target: Object, state_machine: StateMachine, place_state: PlaceState) -> void:
	super(target, state_machine, place_state)

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	direction = state_machine.raw_direction.normalized()
	direction = direction.rotated(Vector3.UP, target.camera.rotation.y)
	
	velocity = direction * place_state.max_speed
	
	target.velocity.x = lerp(target.velocity.x, velocity.x, \
	 place_state.acceleration_weight)
	target.velocity.z = lerp(target.velocity.z, velocity.z, \
	 place_state.acceleration_weight)
	
	target.move_and_slide()

func exit_state(new_state_index: StateMachine.States) -> bool:
	return is_state_valid(new_state_index)
