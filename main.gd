extends Control
const pk = preload("res://päkapikk.tscn")
const kollanepk = preload("res://kollanepäkapikk.tscn")
var enemy_factory
var kollane_enemy_factory
var päkkapikke=0
var kollaseidpäkkapikke=0
var rng = RandomNumberGenerator.new()
@onready var spawner=$"."
@onready var pada = $Pada

var kaspadas=false
# Kursori asjad
var kursor = load("res://assets/cursor/cursor_grab.png")
var kursor_vajutus = load("res://assets/cursor/cursor_grabbing.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	# Kursor default
	Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))
	enemy_factory = pk.instantiate()
	kollane_enemy_factory=kollanepk.instantiate()
	add_enemy()
	kollaneadd_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Kursori vajutus
	if Input.is_action_pressed("BUTTON_LEFT"):
		Input.set_custom_mouse_cursor(kursor_vajutus, Input.CURSOR_ARROW, Vector2(16,16))
	if Input.is_action_just_released("BUTTON_LEFT"):
		Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))
	pass


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


func _on_jook_pressed():
	pass # Replace with function body.
func add_enemy():
	var enemy = enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position=Vector2( rng.randf_range(0,1)*500, rng.randf_range(0,1)*500)
func kollaneadd_enemy():
	var enemy = kollane_enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position=Vector2( rng.randf_range(0,1)*1000, rng.randf_range(0,1)*600)
	
func getpada():
	return kaspadas

func _on_pada_mouse_entered():
	kaspadas=true# Replace with function body.


func _on_pada_mouse_exited():
	kaspadas=false# Replace with function body.
