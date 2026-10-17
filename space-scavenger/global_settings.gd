extends Node
class_name GlobalSettingsManager

# 🧠 Memory Storage for the Settings
var current_music: float = 1.0
var current_sfx: float = 1.0
var current_brightness: float = 1.0

# 🎵 Apply Music Volume
func apply_music(value: float):
	current_music = value
	var bus_index = AudioServer.get_bus_index("Music")
	if bus_index != -1:
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

# 🔊 Apply SFX Volume
func apply_sfx(value: float):
	current_sfx = value
	var bus_index = AudioServer.get_bus_index("SFX")
	if bus_index != -1:
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

# ☀️ Apply Screen Brightness
func apply_brightness(value: float):
	current_brightness = value
	var canvas_mod = get_tree().current_scene.find_child("CanvasModulate", true, false)
	if canvas_mod:
		canvas_mod.color = Color(value, value, value, 1.0)

#------------------------------------------------------------------------------------------------
# 🧠 Three separate counters
var item_1_count: int = 0
var item_2_count: int = 0
var item_3_count: int = 0

# Reference to the screen UI so we can update it live
var ui_layer = null

func collect_item(type: int):
	if type == 1: item_1_count += 1
	elif type == 2: item_2_count += 1
	elif type == 3: item_3_count += 1
	
	# Tell the UI screen to update its text display
	if ui_layer and ui_layer.has_method("update_labels"):
		ui_layer.update_labels()
