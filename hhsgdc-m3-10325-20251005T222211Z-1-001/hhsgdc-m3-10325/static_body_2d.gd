extends AnimatableBody2D


var speed = .75

func _physics_process(delta: float) -> void:
	position.x-=speed
