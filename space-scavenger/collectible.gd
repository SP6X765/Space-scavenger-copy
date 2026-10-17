@tool
extends Area2D

# 1. Safely grab the node reference first at the very top!
@onready var placeholder_text = $PlaceholderText

@export_range(1, 3) var item_type: int = 1:
	set(value):
		item_type = value
		# Updates inside the editor workspace
		if has_node("PlaceholderText"):
			$PlaceholderText.text = str(value)

func _ready():
	body_entered.connect(_on_body_entered)
	
	# 2. Use the safe variable reference here!
	if placeholder_text:
		placeholder_text.text = str(item_type)

func _on_body_entered(body: Node2D):
	if body.name == "Player" or body.is_in_group("player"):
		var global_node = get_tree().root.get_node_or_null("GlobalSettings")
		if global_node:
			global_node.collect_item(item_type)
		queue_free()
