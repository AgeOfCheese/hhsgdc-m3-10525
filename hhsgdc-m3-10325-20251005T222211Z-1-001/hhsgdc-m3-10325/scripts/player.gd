extends CharacterBody2D


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	
	
	
	
	
	#apply the effects of gravity
	velocity.y-=9.8
	
	#postion updated
	position-=velocity
