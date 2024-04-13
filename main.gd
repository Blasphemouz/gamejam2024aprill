extends Control
const pk = preload("res://päkapikk.tscn")
const kollanepk = preload("res://kollanepäkapikk.tscn")
var enemy_factory
var kollane_enemy_factory
var päkkapikke=0
var kollaseidpäkkapikke=0
var rng = RandomNumberGenerator.new()
@onready var spawner=$"."
# Kursori asjad
var kursor = load("res://assets/cursor/cursor_grab.png")
var kursor_vajutus = load("res://assets/cursor/cursor_grabbing.png")
@onready var pada = $Pada


# Called when the node enters the scene tree for the first time.
func _ready():
	# Kursor default
	Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))
	enemy_factory = pk.instantiate()
	kollane_enemy_factory=kollanepk.instantiate()
	add_enemy()
	kollaneadd_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Kursori vajutus
	if Input.is_action_pressed("BUTTON_LEFT"):
		Input.set_custom_mouse_cursor(kursor_vajutus, Input.CURSOR_ARROW, Vector2(16,16))
	if Input.is_action_just_released("BUTTON_LEFT"):
		Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))


func _on_vesi_pressed():
	pass

func _on_juust_pressed():
	pass # Replace with function body.
func lisapäkapikk():
	päkkapikke+=1
	add_enemy()
func lisakollanepäkapikk():
	kollaseidpäkkapikke+=1
	kollaneadd_enemy()
func getpada():
	var hiir= get_global_mouse_position()
	if(pada.position.x < hiir.x and hiir.x  < (pada.position.x + pada.get_rect().size.x) and pada.position.y < hiir.y and hiir.y < (pada.position.y + pada.get_rect().size.x)):
		return true
	else:
		return false
func _on_jook_pressed():
	pass # Replace with function body.
func add_enemy():
	var enemy = enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position=Vector2( rng.randf_range(0,1)*get_viewport().get_visible_rect().size.x, rng.randf_range(0,1)*get_viewport().get_visible_rect().size.y)
func kollaneadd_enemy():
	var enemy = kollane_enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position=Vector2( rng.randf_range(0,1)*get_viewport().get_visible_rect().size.x, rng.randf_range(0,1)*get_viewport().get_visible_rect().size.y)



