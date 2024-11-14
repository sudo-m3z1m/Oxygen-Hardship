extends ItemState

@export var subtract_area: Area3D
@export var area_sphere: MeshInstance3D

func enter_state() -> void:
	subtract_area.set_monitoring(true)

	area_sphere.visible = true
	var tween: Tween = create_tween()
	tween.tween_property(area_sphere, "scale", Vector3.ONE, 0.3)

func update_state(delta: float) -> void:
	pass

func exit_state() -> void:
	subtract_area.set_monitoring(false)
	
	area_sphere.visible = false
	var tween: Tween = create_tween()
	tween.tween_property(area_sphere, "scale", Vector3(0.1, 0.1, 0.1), 0.3)

func use_effect(current_place_state: PlaceState) -> void:
	pass
