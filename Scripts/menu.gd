extends Control
@onready var tutorialpanel = $tutorial/Panel
@onready var vajutus = $vajutus
@onready var control = $"."

# Kursori asjad
var kursor = load("res://assets/cursor/cursor_select.png")
@onready var panel = $Settings/Panel
var kursor_vajutus = load("res://assets/cursor/cursor_select_tap.png")
@onready var välju = $"Settings/Panel/TextureRect/välju"
@onready var audio_stream_player = $AudioStreamPlayer

func _ready():
	# Kursor default
	Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Kursori vajutus
	if Input.is_action_pressed("BUTTON_LEFT"):
		Input.set_custom_mouse_cursor(kursor_vajutus, Input.CURSOR_ARROW, Vector2(16,16))
	if Input.is_action_just_released("BUTTON_LEFT"):
		Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))

func _on_start_pressed():
	audio_stream_player.stop()
	get_tree().change_scene_to_file("res://tutorial.tscn")

func _on_exit_pressed():
	vajutus.play()
	get_tree().quit()

func _on_toutorial_pressed():
	vajutus.play()
	if(panel.visible==true):
		panel.visible=false
	if tutorialpanel.visible==false:
		tutorialpanel.visible=true
	else:
		tutorialpanel.visible=false
		

func _on_exittoutoutorial_pressed():
	vajutus.play()
	if tutorialpanel.visible==true:
		tutorialpanel.visible=false

func _on_settings_pressed():
	if(tutorialpanel.visible==true):
		tutorialpanel.visible=false
	if( panel.visible==false):
		panel.visible=true
		vajutus.play()
	else:
		panel.visible=false

func _on_välju_pressed():
	if( panel.visible==true):
		panel.visible=false
	else:
		panel.visible=true


func _on_check_button_pressed():
	if(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
