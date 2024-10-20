extends ItemState

func enter_state() -> void:
	target.current_item_component = null
	target.collision_shape.set_disabled(false)
	target.freeze = false

func update_state(delta: float) -> void:
	pass

func exit_state() -> void:
	target.collision_shape.set_disabled(true)
	target.freeze = true
