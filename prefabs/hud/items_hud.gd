extends HBoxContainer

class_name ItemsHud

@onready var cells: Array[Node] = get_children()

var current_cell_index: int = 0

func change_current_cell(new_index: int) -> void:
	cells[current_cell_index].set_selected(false)
	current_cell_index = abs(new_index) % cells.size()
	cells[current_cell_index].set_selected(true)

func add_cell_item(cell_index: int, new_item: Item) -> void:
	cells[cell_index].set_item(new_item)
