extends CharacterBody2D

#var terminal_vel = 0.15
var grav_accel = 0.05
var flap_vel = 2
@onready var animation_controller := $AnimatedSprite2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	
	if (Input.is_action_pressed("Flap")):
		velocity.y = flap_vel
		animation_controller.play("flap")
	
	var vel_offset = velocity.y * Vector2.UP + Vector2.RIGHT
	animation_controller.look_at(vel_offset+global_position)
	
	
func _physics_process(delta: float) -> void:
	#apply the effects of gravity
	velocity.y-=grav_accel
	#velocity.y = clamp(velocity.y,-99999,terminal_vel)
	
	#postion updated
	position-=velocity

func die():
	animation_controller.play("idle")
