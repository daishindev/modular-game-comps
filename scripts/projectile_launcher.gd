extends Marker2D

@export var projectile_scene: PackedScene
@export var body : CharacterBody2D
@onready var timer: Timer = $ProjectileRateTimer


func spawn_projectile(direction: Vector2):
	if timer.is_stopped():
		var projectile = projectile_scene.instantiate()
		get_tree().root.add_child(projectile)
		projectile.global_position = global_position
		projectile.movement_vector = direction
		
		if body:
			projectile.inherited_velocity = body.velocity
			
		print("done")
		timer.start()
