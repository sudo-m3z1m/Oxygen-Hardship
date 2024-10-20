extends Node

class_name ItemsComponent

@export var max_hand_items: int

@onready var target: Object = get_parent()
@onready var items_hud: ItemsHud = Hud.get_node("MarginContainer/ItemsHUD")
@onready var items_marker: Marker3D = get_parent().get_node("Camera/ItemsMarker")

var hand_items: Array[Item]
var current_item_index: int = 0

func _ready() -> void:
	for item_index in max_hand_items:
		hand_items.append(Item.new())

func take_item() -> void:
	var raycasting_object: Node3D = target.interaction_raycast.get_collider()

	if raycasting_object is Item:
		add_item(raycasting_object)

func add_item(new_item: Item) -> void:
	for item_index in hand_items.size():
		if hand_items[item_index].identifier:
			continue

		hand_items[item_index] = new_item
		new_item.current_item_component = self
		
		items_hud.add_cell_item(item_index, new_item)
		set_current_item(item_index)

		new_item.global_position = items_marker.global_position
		new_item.reparent(items_marker)
		new_item.rotation = Vector3.ZERO
		
		return

func set_current_item(new_item_index: int) -> void:
	hand_items[current_item_index].change_state(Item.ItemStates.DISABLED)
	current_item_index = new_item_index % max_hand_items
	hand_items[current_item_index].change_state(Item.ItemStates.ENABLED)

	items_hud.change_current_cell(current_item_index)
