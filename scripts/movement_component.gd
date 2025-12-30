class_name MovementComponent
extends Node

@onready var dash_timer: Timer = $DashTimer

@export var body : CharacterBody2D
@export var speed := 150.0
@export var sprint_speed := 2.0
@export var dash_speed := 150.0
@export var dash_cooldown := 1.0

signal dashed

func move(direction: Vector2, is_sprinting: bool, is_dashing: bool):
	if not body: return
	if is_dashing and dash_timer.is_stopped():
		dash_timer.start(dash_cooldown)
		body.move_and_collide(direction * dash_speed)
		dashed.emit()
	else:
		var current_speed = speed
		if is_sprinting:
			current_speed *= sprint_speed
				
		body.velocity = direction * current_speed
		body.move_and_slide()
