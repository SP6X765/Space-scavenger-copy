class_name LevelTemplate
extends Node2D

@onready var kill_zones: KillZones = $KillZones

func _ready() -> void:
	kill_zones.kill_zone_entered.connect(_on_player_killed)
	
func _on_player_killed() -> void:
	get_tree().reload_current_scene.call_deferred()
