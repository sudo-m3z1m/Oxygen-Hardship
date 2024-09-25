extends Node

class_name ItemsComponent

@export var max_hand_items: int

@onready var target: Object = get_parent()
@onready var items_marker: Marker3D = get_parent().get_node("Camera/ItemsMarker")

var hand_items: Array[Item]
var current_item_index: int

func _ready() -> void:
	hand_items.resize(max_hand_items)

func take_item() -> void:
	var raycasting_object: Node3D = target.interaction_raycast.get_collider()

	if raycasting_object is Item:
		add_item(raycasting_object)

func add_item(new_item: Item) -> void:
	for item_index in hand_items.size():
		if hand_items[item_index]:
			continue

		hand_items[item_index] = new_item
		target.items_hud.add_cell_item(item_index, new_item)
		
		new_item.global_position = items_marker.global_position
		new_item.reparent(items_marker)
		return

func set_current_item(item_index: int) -> void:
	pass
