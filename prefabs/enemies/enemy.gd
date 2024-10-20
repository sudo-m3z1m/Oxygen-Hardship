extends CharacterBody3D

@export var max_speed: float
@export_range(0, 1, 0.01) var acceleration_weight: float

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent
@onready var target: Object = get_tree().current_scene.get_node("Player")

func _process(delta: float) -> void:
	navigation_agent.set_target_position(target.global_position)

	look_at(target.global_position)

	var direction = (target.global_position - global_position).normalized()
	velocity = lerp(velocity, direction * max_speed, acceleration_weight)
	move_and_slide()
