extends CanvasLayer

var time = 0

func _process(delta: float) -> void:
	time += delta
	$RichTextLabel.text = str(floor(time))
