class_name HealthComponent

extends Node

@export var body : Node2D
@export var max_health: int = 100
signal health_changed(old_value, new_value)

var health : int:
	set(new_health):
		var old_health = health
		new_health = clamp(new_health,0, max_health)
		health = new_health
		health_changed.emit(old_health, new_health)
	get():
		return health
	
func _ready():
	health = max_health
	health += 100
	print(health) 
	health -= 50
	print(health)
	health -= 100
	print(health)
