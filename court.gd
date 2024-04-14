extends Node2D

var i=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func lose():
	get_tree().change_scene_to_file("res://Objektid/you_lose.tscn")
	
func win():
	get_tree().change_scene_to_file("res://Objektid/you_win.tscn")
func _input(event):
	if i == 0 and event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		i += 1
		Dialogic.end_timeline()
		Dialogic.start("res://court_timeline.dtl")
		get_viewport().set_input_as_handled()
