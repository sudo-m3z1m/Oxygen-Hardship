extends Area3D

class_name HealthComponent

@export var max_health_points: float
@export var min_health_points: float

@onready var target: Object = get_parent()

var health_points: float

func damage(damage_count: float) -> void:
	health_points -= damage_count

	if health_points <= min_health_points:
		target.die()
