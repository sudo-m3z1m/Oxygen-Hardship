extends Panel

class_name InventoryCell

@export var delta_position_y: float
@export var animation_time: float
@export var texture: Texture2D

@onready var texture_rect: TextureRect = $MarginContainer/TextureRect

var item: Item

func set_selected(is_selected: bool) -> void:
	var new_y: float = delta_position_y * int(is_selected)
	create_tween().tween_property(self, "position:y", new_y, animation_time)

func set_item(new_item: Item) -> void:
	item = new_item
	texture_rect.texture = texture
	#TODO change picture
