extends Control
@onready var tutorialpanel = $tutorialpanel
@onready var vajutus = $vajutus
@onready var control = $"."

# Kursori asjad
var kursor = load("res://assets/cursor/cursor_select.png")
@onready var panel = $Settings/Panel
var kursor_vajutus = load("res://assets/cursor/cursor_select_tap.png")
@onready var välju = $"Settings/Panel/välju"

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
	get_tree().change_scene_to_file("res://main.tscn")
	
	


func _on_exit_pressed():
	vajutus.play()
	get_tree().quit()


func _on_toutorial_pressed():
	vajutus.play()
	tutorialpanel.visible=true



func _on_exittoutoutorial_pressed():
	vajutus.play()
	if tutorialpanel.visible==true:
		tutorialpanel.visible=false


func _on_settings_pressed():
	if( panel.visible==false):
		panel.visible=true
	else:
		panel.visible=false

func _on_välju_pressed():
	if( panel.visible==true):
		panel.visible=false
	else:
		panel.visible=true
