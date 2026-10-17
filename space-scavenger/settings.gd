extends Control

@onready var music_slider: HSlider = $VBoxContainer/Musicvolume/MusicSlider
@onready var sfx_slider: HSlider = $VBoxContainer/SFXvolume/SFXSlider
@onready var brightness_slider: HSlider = $VBoxContainer/Brightness/BrightnessSlider


func _ready():
	# 📡 1. Load the remembered positions from global memory
	var global_node = get_tree().root.get_node_or_null("GlobalSettings")
	if global_node:
		music_slider.value = global_node.current_music
		sfx_slider.value = global_node.current_sfx
		brightness_slider.value = global_node.current_brightness

	# 🔌 2. Wire up the slider movement signals
	music_slider.value_changed.connect(_on_music_changed)
	sfx_slider.value_changed.connect(_on_sfx_changed)
	brightness_slider.value_changed.connect(_on_brightness_changed)
	$VBoxContainer/BackButton.pressed.connect(_on_back_pressed)

func _on_music_changed(value: float):
	var global_node = get_tree().root.get_node_or_null("GlobalSettings")
	if global_node: global_node.apply_music(value)

func _on_sfx_changed(value: float):
	var global_node = get_tree().root.get_node_or_null("GlobalSettings")
	if global_node: global_node.apply_sfx(value)

func _on_brightness_changed(value: float):
	var global_node = get_tree().root.get_node_or_null("GlobalSettings")
	if global_node: global_node.apply_brightness(value)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")
