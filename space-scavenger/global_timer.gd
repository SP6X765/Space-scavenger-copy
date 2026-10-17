extends Node

# ⏱️ CHANGE THIS NUMBER: The starting time limit in seconds.
# Set this to 30.0 for a 30-second game, 60.0 for 1 minute, etc.
const INITIAL_TIME: float = 30.0

var time_left: float = INITIAL_TIME
var is_active: bool = false

func _process(delta: float) -> void:
	if is_active and time_left > 0.0:
		time_left -= delta
		if time_left <= 0.0:
			time_left = 0.0
			is_active = false
			_trigger_game_over()

func _trigger_game_over() -> void:
	get_tree().change_scene_to_file("res://game_over.tscn")

func reset_timer() -> void:
	time_left = INITIAL_TIME
	is_active = true
