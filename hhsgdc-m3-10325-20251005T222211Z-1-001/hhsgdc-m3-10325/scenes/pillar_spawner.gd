extends Node

const PILLAR_BODY = preload("res://pillar_body.tscn")
var random_offset = 100 #vertical
@export var start_pos := Vector2(300,150) #vertical
var space_in_between = 250
@onready var timer := $Timer 


func _on_timer_timeout() -> void:
	var offset = Vector2(0,-randf()*random_offset)
	
	var pillar_top = PILLAR_BODY.instantiate()
	pillar_top.position = start_pos + Vector2.UP * space_in_between/2 + offset
	pillar_top.rotation = PI
	add_child(pillar_top)
	
	var pillar_bottom = PILLAR_BODY.instantiate()
	pillar_bottom.position = start_pos + Vector2.DOWN * space_in_between/2 + offset
	add_child(pillar_bottom)
	timer.start()
