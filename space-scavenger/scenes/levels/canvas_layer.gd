extends CanvasLayer

@onready var timer_label: Label = $TimerLabel

func _ready():
	# Forces the scene to check the global brightness value as soon as it boots up
	GlobalSettings.apply_brightness(GlobalSettings.current_brightness)

func _process(_delta: float) -> void:
	# Read the time directly from the global background script
	var current_time = GlobalTimer.time_left
	
	var minutes: int = int(current_time) / 60
	var seconds: int = int(current_time) % 60
	
	timer_label.text = "%02d:%02d" % [minutes, seconds]
