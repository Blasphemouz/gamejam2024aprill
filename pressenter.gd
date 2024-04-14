extends Node2D

var i = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if i == 0 and event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		i += 1
		Dialogic.end_timeline()
		Dialogic.start('poliisi_sauna')
		get_viewport().set_input_as_handled()
