class_name MovementComponent

extends Node

@export var sprint_speed := 2.0
@export var body : CharacterBody2D
@export var speed := 150.0
@export var dash_distance := 100.0
var input = Input.get_vector("move_left", "move_right","move_forward", "move_backward")

func move(direction: Vector2, is_sprinting: bool):
	if body:
		var current_speed = speed
		if is_sprinting:
			current_speed *= sprint_speed
			
		body.velocity = direction * current_speed
		body.move_and_slide()


func dash(direction: Vector2):
	if Input.is_action_just_pressed("dash"):
		body.move_and_collide(direction * dash_distance)
