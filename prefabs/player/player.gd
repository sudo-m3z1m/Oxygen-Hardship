extends CharacterBody3D

class_name Player

@onready var camera: Camera3D = $Camera
@onready var state_machine: StateMachine = $StateMachine
@onready var input_handler: InputHandler = $InputHandler
@onready var items_component: ItemsComponent = $ItemsComponent
@onready var items_hud: ItemsHud = Hud.get_node("MarginContainer/ItemsHUD")
@onready var interaction_raycast: RayCast3D = $Camera/InteractionRaycast

@export var gravity: float

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta: float):
	velocity.y -= gravity * delta

func die() -> void:
	queue_free()
