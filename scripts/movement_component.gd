class_name MovementComponent

extends Node

@export var sprint_speed := 2.0
@export var body : CharacterBody2D
@export var speed := 150.0
@export var dash_distance := 100.0

func move(direction: Vector2, is_sprinting: bool, is_dashing: bool):
	if not body: return
	if is_dashing:
			body.move_and_collide(direction * dash_distance)
	else:
		var current_speed = speed
		if is_sprinting:
			current_speed *= sprint_speed
				
		body.velocity = direction * current_speed
		body.move_and_slide()
