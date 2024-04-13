extends Control
const pk = preload("res://päkapikk.tscn")
const kollanepk = preload("res://kollanepäkapikk.tscn")
var enemy_factory
var kollane_enemy_factory
var päkkapikke=0
var kollaseidpäkkapikke=0
var rng = RandomNumberGenerator.new()
var mesi=0
var jook =0
var vesi=0
var lapinkulta=0
@onready var spawner=$"."
# Kursori asjad
var kursor = load("res://assets/cursor/cursor_grab.png")
var kursor_vajutus = load("res://assets/cursor/cursor_grabbing.png")
@onready var pada = $Pada
@onready var pildid = $Panel



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

func lisapäkapikk():
	päkkapikke+=1
	pildid.lisa("punane", päkkapikke)
	add_enemy()
func lisamuu(nood):
	if(nood.name=="honey"):
		mesi+=1
		pildid.lisa("honey", mesi)
	if(nood.name=="jook"):
		jook+=1
		pildid.lisa("jook",jook)
	if(nood.name=="vesi"):
		vesi+=1
		pildid.lisa("vesi", vesi)
	if(nood.name=="lapinkulta"):
		lapinkulta+=1
		pildid.lisa("lapinkulta",lapinkulta)
func lisakollanepäkapikk():
	kollaseidpäkkapikke+=1
	pildid.lisa("kollane",kollaseidpäkkapikke)
	kollaneadd_enemy()
func getpada():
	var hiir= get_global_mouse_position()
	if(pada.position.x < hiir.x and hiir.x  < (pada.position.x + pada.get_rect().size.x) and pada.position.y < hiir.y and hiir.y < (pada.position.y + pada.get_rect().size.x)):
		return true
	else:
		return false
func add_enemy():
	var enemy = enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position=Vector2( rng.randf_range(0,1)*get_viewport().get_visible_rect().size.x, rng.randf_range(0,1)*get_viewport().get_visible_rect().size.y)
func kollaneadd_enemy():
	var enemy = kollane_enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position=Vector2( rng.randf_range(0,1)*get_viewport().get_visible_rect().size.x, rng.randf_range(0,1)*get_viewport().get_visible_rect().size.y)


func _on_järgminestseen_pressed():
	if(jook>10):
		pass
	#erinevad stseenid pärast seda vastavalt potis olevatale asjadele
