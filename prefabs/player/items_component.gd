extends Node

class_name ItemsComponent

@export var max_hand_items: int

var hand_items: Array
var current_item_index: int

func add_item(new_item) -> void:
	if hand_items.size() + 1 > max_hand_items:
		return
	hand_items.append(new_item)

func set_current_item(item_index: int) -> void:
	pass
