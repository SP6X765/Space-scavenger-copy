class_name KillZones
extends Node

signal kill_zone_entered

@export var kill_zones: Array[Area2D] = []

func _ready() -> void:
	for kill_zone in kill_zones:
		kill_zone.body_entered.connect(_on_kill_zone_body_entered)

func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		kill_zone_entered.emit()
