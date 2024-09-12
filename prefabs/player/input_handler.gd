extends Node

class_name InputHandler

@onready var state_machine = get_parent().get_node("StateMachine")

var inputs_actions: Array[String] = [
	"Space",
	"Down",
	"Interact",
	"Drop",
	"Use"
]

func _unhandled_input(event: InputEvent) -> void:
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
			pass
		"Use":
			pass
		"Drop":
			pass
