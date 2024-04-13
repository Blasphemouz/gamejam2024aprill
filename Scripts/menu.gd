extends Control
@onready var toutorialpanel = $toutorialpanel
@onready var vajutus = $vajutus
@onready var control = $"."

# Kursori asjad
var kursor = load("res://assets/cursor/cursor_select.png")
var kursor_vajutus = load("res://assets/cursor/cursor_select_tap.png")
# Called when the node enters the scene tree for the first time.

func _ready():
	Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
	toutorialpanel.visible=true



func _on_exittoutoutorial_pressed():
	vajutus.play()
	if toutorialpanel.visible==true:
		toutorialpanel.visible=false
