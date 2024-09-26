extends Node

class_name InputHandler

@export_range(0, 1) var camera_sensitivity: float
@export_range(0, 180, 0.01, "radians_as_degrees") var camera_angle_x_max: float

@onready var target: Player = get_parent()
@onready var state_machine = get_parent().get_node("StateMachine")

var inputs_actions: Array[String] = [
	"Space",
	"Down",
	"Interact",
	"Drop",
	"Use",
	"ScrollUp",
	"ScrollDown"
]

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_camera(event.relative)

	for action in inputs_actions:
		if !event.is_action_pressed(action):
			continue
		set_action_event(action)

func get_moving_input() -> Vector3:
	var direction: Vector3 = Vector3.ZERO

	if Input.is_action_pressed("Forward"):
		direction.z -= 1
	if Input.is_action_pressed("Back"):
		direction.z += 1
	if Input.is_action_pressed("Left"):
		direction.x -= 1
	if Input.is_action_pressed("Right"):
		direction.x += 1
	if Input.is_action_pressed("Down"):
		direction.y -= 1
	if Input.is_action_pressed("Space"): #TODO this is biggest shit in my life
		direction.y += 1

	return direction

func set_action_event(action: String) -> void:
	match action:
		"Space":
			state_machine.change_state(StateMachine.States.JUMP)
		"Down":
			pass
		"Interact":
			target.items_component.take_item()
		"Use":
			pass
		"Drop":
			pass
		"ScrollUp":
			target.items_component.set_current_item(target.items_component.current_item_index + 1)
		"ScrollDown":
			target.items_component.set_current_item(target.items_component.current_item_index - 1)

func rotate_camera(relative_vector: Vector2) -> void:
	var camera: Camera3D = target.camera
	camera.rotation.x -= relative_vector.y * camera_sensitivity
	camera.rotation.y -= relative_vector.x * camera_sensitivity

	camera.rotation.x = clamp(camera.rotation.x, -camera_angle_x_max, camera_angle_x_max)
