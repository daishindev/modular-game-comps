extends CharacterBody2D

@onready var movement_component: MovementComponent = $MovementComponent
		
func _physics_process(_delta):
	var input = Input.get_vector("move_left", "move_right","move_forward", "move_backward")
	var is_sprinting = Input.is_action_pressed("sprint")
	var is_dashing = Input.is_action_just_pressed("dash")
	movement_component.move(input,is_sprinting,is_dashing)
	
	print(velocity)
	
