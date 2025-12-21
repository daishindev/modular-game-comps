extends CharacterBody2D

@export var speed := 150.0
@export var sprint_speed := 2.0
@export var dash_distance := 100.0

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	velocity = input_direction * speed
	if Input.is_action_pressed("sprint"):
		velocity *= sprint_speed
	elif Input.is_action_just_pressed("dash"):
		move_and_collide(input_direction * dash_distance)
func _physics_process(delta):
	get_input()
	move_and_slide()
