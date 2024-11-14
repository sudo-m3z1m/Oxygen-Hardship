extends RigidBody3D

class_name Item

@export var identifier: int = 0

@onready var collision_shape: CollisionShape3D = $CollisionShape
@onready var model: Node3D = $Model

@onready var current_item_state: ItemState = $States/Dropped

@onready var item_states: Dictionary = {
	ItemStates.ENABLED: $States/Enabled,
	ItemStates.DISABLED: $States/Disabled,
	ItemStates.DROPPED: $States/Dropped,
	ItemStates.USED: $States/Used
}

enum ItemStates {
	ENABLED,
	DISABLED,
	DROPPED,
	USED
}

func _process(delta: float) -> void:
	current_item_state.update_state(delta)

func change_state(new_item_state_index: ItemStates) -> void:
	if !identifier or item_states[new_item_state_index] == current_item_state:
		return
	
	current_item_state.exit_state()
	current_item_state = item_states[new_item_state_index]
	current_item_state.enter_state()
