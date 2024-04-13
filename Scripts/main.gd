extends Control
const pk = preload("res://päkapikk.tscn")
const kollanepk = preload("res://kollanepäkapikk.tscn")
var enemy_factory
var kollane_enemy_factory
var päkkapikke=0
var kollaseidpäkkapikke=0
var rng = RandomNumberGenerator.new()
@onready var spawner=$"."

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_factory = pk.instantiate()
	kollane_enemy_factory=kollanepk.instantiate()
	add_enemy()
	kollaneadd_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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



