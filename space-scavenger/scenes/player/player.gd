class_name Player
extends CharacterBody2D

@export var SPEED := 250.0
@export var ACCELERATION := 1300.0
@export var FRICTION := 1400.0
@export var JUMP_VELOCITY := -560.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_jump_timer: Timer = $CoyoteJumpTimer

func _physics_process(delta: float) -> void:
	var input_axis := Input.get_axis("move_left", "move_right")
	
	_apply_gravity(delta)
	_handle_jump()
	_handle_move(input_axis, delta)
	_apply_friction(input_axis, delta)
	_update_animations(input_axis)
	
	var was_on_floor = is_on_floor()
	
	move_and_slide()
	
	if was_on_floor and not is_on_floor() and velocity.y >= 0:
		coyote_jump_timer.start()
	
func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func _handle_jump() -> void:
	if is_on_floor() or coyote_jump_timer.time_left > 0.0:
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			coyote_jump_timer.stop()
			
func _handle_move(input_axis: float, delta: float) -> void:
	velocity.x = move_toward(velocity.x, SPEED * input_axis, ACCELERATION * delta)
		
func _apply_friction(input_axis: float, delta: float) -> void:
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		
func _update_animations(input_axis: float) -> void:
	if input_axis != 0:
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = (input_axis < 0)
	else:
		animated_sprite_2d.play("idle")
		
	if not is_on_floor():
		animated_sprite_2d.play("jump")
