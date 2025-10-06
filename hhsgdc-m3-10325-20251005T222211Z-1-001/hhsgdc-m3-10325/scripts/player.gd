extends CharacterBody2D

#var terminal_vel = 0.15
var grav_accel = 0.08
var flap_vel = 2
@onready var animation_controller := $AnimatedSprite2D
var dead = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var vel_offset = velocity.y * Vector2.UP + Vector2.RIGHT
	animation_controller.look_at(vel_offset+global_position)
	
	if (dead):
		return
	
	if (Input.is_action_pressed("Flap")):
		velocity.y = flap_vel
		animation_controller.play("flap")
	
func _physics_process(delta: float) -> void:
	
	#apply the effects of gravity
	velocity.y-=grav_accel
	
	#postion updated
	move_and_collide(-velocity)
	#position-=velocity

func die():
	animation_controller.play("idle")
	dead = true
	print("labubu")
	#velocity+=Vector2((randf()-0.5)*-20,-10).normalized() #variablize bunh


func _on_area_2d_body_entered(body: Node2D) -> void:
	die()
