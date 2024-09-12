extends CharacterBody3D

class_name Player

@onready var camera: Camera3D = $Camera
@onready var state_machine: StateMachine = $StateMachine
@onready var input_handler: InputHandler = $InputHandler

@export var gravity: float

@export_range(0, 1) var camera_sensitivity: float
@export_range(0, 180, 0.01, "radians_as_degrees") var camera_angle_x_max: float

var moving_speed: float
var acceleration_weight: float
var inertia_weight: float

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta: float):
	velocity.y -= gravity * delta
	
	move_and_slide()

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		rotate_camera(event.relative)

func rotate_camera(relative_vector: Vector2) -> void:
	camera.rotation.x -= relative_vector.y * camera_sensitivity
	camera.rotation.y -= relative_vector.x * camera_sensitivity
	
	camera.rotation.x = clamp(camera.rotation.x, -camera_angle_x_max, camera_angle_x_max)
