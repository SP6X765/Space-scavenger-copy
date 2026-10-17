extends CanvasLayer

@onready var item_1: Label = $VBoxContainer/Item1
@onready var item_2: Label = $VBoxContainer/Item2
@onready var item_3: Label = $VBoxContainer/Item3


func _ready():
	# Register this UI scene with the global tracker
	var global_node = get_tree().root.get_node_or_null("GlobalSettings")
	if global_node:
		global_node.ui_layer = self
		update_labels()

func update_labels():
	var global_node = get_tree().root.get_node_or_null("GlobalSettings")
	if global_node:
		item_1.text = "Item 1: " + str(global_node.item_1_count)
		item_2.text = "Item 2: " + str(global_node.item_2_count)
		item_3.text = "Item 3: " + str(global_node.item_3_count)
