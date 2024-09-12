extends Area3D

func _ready() -> void:
	body_entered.connect(check_player)
	body_exited.connect(player_exited)

func check_player(body: Node3D) -> void:
	if !(body is Player):
		return
	body.state_machine.set_current_place_state(StateMachine.PlaceStates.ABOVE_WATER)

func player_exited(body: Node3D) -> void:
	if !(body is Player):
		return
	body.state_machine.set_current_place_state(StateMachine.PlaceStates.UNDERWATER)
