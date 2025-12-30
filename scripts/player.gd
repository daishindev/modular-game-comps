extends CharacterBody2D

@onready var movement_component: MovementComponent = $MovementComponent
@onready var projectile_launcher: Marker2D = $ProjectileLauncher

		
func _physics_process(_delta):
	var input = Input.get_vector("move_left", "move_right","move_forward", "move_backward")
	var is_sprinting = Input.is_action_pressed("sprint")
	var is_dashing = Input.is_action_just_pressed("dash")
	movement_component.move(input,is_sprinting,is_dashing)
	
	var shoot_dir = Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down")
	if shoot_dir != Vector2.ZERO:
		if abs(shoot_dir.x) > abs(shoot_dir.y):
			shoot_dir.y = 0
		else:
			shoot_dir.x = 0
		
		shoot_dir = shoot_dir.normalized()
		projectile_launcher.spawn_projectile(shoot_dir)
		

	
