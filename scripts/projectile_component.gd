class_name ProjectileComponent
extends Area2D

@export var projectile_speed := 300.0 
var inherited_velocity: Vector2 = Vector2.ZERO
var movement_vector: Vector2

func _physics_process(delta: float) -> void:
	
	var final_velocity = (movement_vector * projectile_speed) + inherited_velocity
	global_position += final_velocity * delta
	inherited_velocity *= 0.95
	
