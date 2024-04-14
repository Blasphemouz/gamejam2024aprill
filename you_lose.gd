extends Control


func _input(event):
	
	if event.is_action_pressed("dialogic_default_action"):
		get_tree().change_scene_to_file("res://Objektid/control.tscn")
