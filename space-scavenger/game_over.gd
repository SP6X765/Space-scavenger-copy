extends Control

@onready var home_button: Button = $HomeButton

func _ready() -> void:
	if home_button:
		home_button.pressed.connect(_on_home_pressed)

func _on_home_pressed() -> void:
	# Change back to the main start menu scene
	get_tree().change_scene_to_file("res://start_menu.tscn")
