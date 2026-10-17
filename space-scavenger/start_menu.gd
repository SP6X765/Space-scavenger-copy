extends Control

@onready var start_button: Button = $Start

func _ready() -> void:
	if start_button:
		start_button.pressed.connect(_on_start_pressed)
	else:
		push_error("Could not find a node named 'Start' under your StartMenu!")
		GlobalSettings.apply_brightness(GlobalSettings.current_brightness)

func _on_start_pressed() -> void:
	# ⏱️ Tell the global script to reset back to full time and start ticking
	GlobalTimer.reset_timer()
	
	# Load into your level template path
	get_tree().change_scene_to_file("res://scenes/levels/level_template.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")
