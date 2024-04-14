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
var viht1 = 0
var viht2 = 0
var viht3 = 0

@onready var spawner = $"."
@onready var pause_menu = $pause_menu
var paused = false
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
	if Input.is_action_just_pressed("Puase"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

func lisamuu(nood):
	if(nood.name == "honey"):
		mesi += 1
		pildid.lisa("honey", mesi)
		
	if(nood.name == "jook"):
		jook += 1
		pildid.lisa("jook",jook)
		promillleil()
		
	if(nood.name == "vesi"):
		vesi += 1
		pildid.lisa("vesi", vesi)
		
	if(nood.name == "lapinkulta"):
		lapinkulta += 1
		pildid.lisa("lapinkulta",lapinkulta)
		promillleil()
		
	if (nood.name == "viht1"):
		viht1 += 1
		pildid.lisa("viht1", viht1)
	if (nood.name == "viht2"):
		viht2 += 1
		pildid.lisa("viht2", viht2)
	if (nood.name == "viht3"):
		viht3 += 1
		pildid.lisa("viht3", viht3)

func lisapäkapikk():
	päkkapikke += 1
	pildid.lisa("punane", päkkapikke)
	add_enemy()
	tonttuslaughter()
	
func tonttuslaughter():
	if (kollaseidpäkkapikke + päkkapikke + siniseidpäkkapikke + rohelisipäkkapikke == 3):
		$GoodSlaughterPlayer.play()
		$GoodSlaughter.visible = not $GoodSlaughter.visible
		$GoodSlaughterTimer.start()
		
func promillleil():
	if (lapinkulta + jook == 3):
		$GoodBeerPlayer.play()
		$GoodBeer.visible = not $GoodBeer.visible
		$GoodBeerTimer.start()

func lisakollanepäkapikk():
	kollaseidpäkkapikke += 1
	pildid.lisa("kollane", kollaseidpäkkapikke)
	kollaneadd_enemy()
	tonttuslaughter()
	
func lisasininepäkapikk():
	siniseidpäkkapikke += 1
	pildid.lisa("sinine", siniseidpäkkapikke)
	sinineadd_enemy()
	tonttuslaughter()
	
func lisarohelinepäkapikk():
	rohelisipäkkapikke += 1
	pildid.lisa("roheline", rohelisipäkkapikke)
	rohelineadd_enemy()
	tonttuslaughter()

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
	Stats.muuda(päkkapikke,kollaseidpäkkapikke,siniseidpäkkapikke,rohelisipäkkapikke,mesi, jook, vesi, lapinkulta, viht1, viht2, viht3)
	get_tree().change_scene_to_file("res://jyrki_judgment.tscn")
	Dialogic.start("res://assets/jyrki/Jyrki_riided/jyrki_judgment_timeline.dtl") 


func _on_pressed():
	pass # Replace with function body.


func _on_good_beer_timer_timeout():
	$GoodBeer.visible = not $GoodBeer.visible


func _on_good_slaughter_timer_timeout():
	$GoodSlaughter.visible = not $GoodSlaughter.visible


func _on_vesi_mouse_entered():
	$vesi/vesiDesc.visible = true


func _on_vesi_mouse_exited():
	$vesi/vesiDesc.visible  = false


func _on_jook_mouse_entered():
	$jook/jookDesc.visible = true


func _on_jook_mouse_exited():
	$jook/jookDesc.visible = false


func _on_honey_mouse_entered():
	$honey/honeyDesc.visible = true


func _on_honey_mouse_exited():
	$honey/honeyDesc.visible = false


func _on_lapinkulta_mouse_entered():
	$lapinkulta/lapinDesc.visible = true
	


func _on_lapinkulta_mouse_exited():
	$lapinkulta/lapinDesc.visible = false


func _on_viht_1_mouse_entered():
	$viht1/viht1Desc.visible = true


func _on_viht_1_mouse_exited():
	$viht1/viht1Desc.visible = false
	



func _on_viht_2_mouse_entered():
	$viht2/viht2Desc.visible = true


func _on_viht_2_mouse_exited():
	$viht2/viht2Desc.visible = false


func _on_viht_3_mouse_entered():
	$viht3/viht3Desc.visible = true


func _on_viht_3_mouse_exited():
	$viht3/viht3Desc.visible = false
