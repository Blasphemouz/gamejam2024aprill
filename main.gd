extends Control

const pk = preload("res://päkapikk.tscn")
const kollanepk = preload("res://kollanepäkapikk.tscn")
const sininepk = preload("res://sininepäkapikk.tscn")
const rohelinepk = preload("res://rohelinepäkapikk.tscn")

var enemy_factory
var kollane_enemy_factory
var sinine_enemy_factory
var roheline_enemy_factory

var päkkapikke = 0
var kollaseidpäkkapikke = 0
var siniseidpäkkapikke = 0
var rohelisipäkkapikke = 0

var rng = RandomNumberGenerator.new()

var mesi = 0
var jook = 0
var vesi = 0
var lapinkulta = 0

@onready var spawner = $"."

# Kursori asjad
var kursor = load("res://assets/cursor/cursor_grab.png")
var kursor_vajutus = load("res://assets/cursor/cursor_grabbing.png")

@onready var pada = $Pada
@onready var pildid = $Panel

func _ready():
	# Kursor default
	Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))
	
	enemy_factory = pk.instantiate()
	kollane_enemy_factory = kollanepk.instantiate()
	sinine_enemy_factory = sininepk.instantiate()
	roheline_enemy_factory = rohelinepk.instantiate()
	
	add_enemy()
	kollaneadd_enemy()
	sinineadd_enemy()
	rohelineadd_enemy()


# Kursori asjad
func _process(_delta):
	#Kursori vajutus
	if Input.is_action_pressed("BUTTON_LEFT"):
		Input.set_custom_mouse_cursor(kursor_vajutus, Input.CURSOR_ARROW, Vector2(16,16))
	if Input.is_action_just_released("BUTTON_LEFT"):
		Input.set_custom_mouse_cursor(kursor, Input.CURSOR_ARROW, Vector2(16,16))
	
func lisamuu(nood):
	if(nood.name == "honey"):
		mesi += 1
		pildid.lisa("honey", mesi)
		
	if(nood.name == "jook"):
		jook += 1
		pildid.lisa("jook",jook)
		
	if(nood.name == "vesi"):
		vesi += 1
		pildid.lisa("vesi", vesi)
		
	if(nood.name == "lapinkulta"):
		lapinkulta += 1
		pildid.lisa("lapinkulta",lapinkulta)

func lisapäkapikk():
	päkkapikke += 1
	pildid.lisa("punane", päkkapikke)
	add_enemy()

func lisakollanepäkapikk():
	kollaseidpäkkapikke += 1
	pildid.lisa("kollane", kollaseidpäkkapikke)
	kollaneadd_enemy()
	
func lisasininepäkapikk():
	siniseidpäkkapikke += 1
	pildid.lisa("sinine", siniseidpäkkapikke)
	sinineadd_enemy()

func lisarohelinepäkapikk():
	rohelisipäkkapikke += 1
	pildid.lisa("roheline", rohelisipäkkapikke)
	rohelineadd_enemy()

func getpada():
	var hiir= get_global_mouse_position()
	if(pada.position.x < hiir.x and hiir.x  < (pada.position.x + pada.get_rect().size.x) and pada.position.y < hiir.y and hiir.y < (pada.position.y + pada.get_rect().size.x)):
		return true
	else:
		return false

func add_enemy():
	var enemy = enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position = Vector2( rng.randf_range(0,1)*get_viewport().get_visible_rect().size.x, rng.randf_range(0.3,0.7)*get_viewport().get_visible_rect().size.y)

func kollaneadd_enemy():
	var enemy = kollane_enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position = Vector2( rng.randf_range(0,1)*get_viewport().get_visible_rect().size.x, rng.randf_range(0.3,0.7)*get_viewport().get_visible_rect().size.y)

func sinineadd_enemy():
	var enemy = sinine_enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position = Vector2( rng.randf_range(0,1)*get_viewport().get_visible_rect().size.x, rng.randf_range(0.3,0.7)*get_viewport().get_visible_rect().size.y)
	
func rohelineadd_enemy():
	var enemy = roheline_enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position = Vector2( rng.randf_range(0,1)*get_viewport().get_visible_rect().size.x, rng.randf_range(0.3,0.7)*get_viewport().get_visible_rect().size.y)

func _on_järgminestseen_pressed():
	if(jook>10):
		pass
	#erinevad stseenid pärast seda vastavalt potis olevatale asjadele
