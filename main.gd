extends Control
const pk = preload("res://päkapikk.tscn")
@onready var vaenlased = $vaenlased
var enemy_factory
var päkkapikke=0
@onready var spawner=$"."

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_factory = pk.instantiate()
	add_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_vesi_pressed():
	add_enemy()


func _on_juust_pressed():
	pass # Replace with function body.
func lisapäkapikk():
	päkkapikke+=1
	#add_enemy()
	print(päkkapikke)


func _on_jook_pressed():
	pass # Replace with function body.
func add_enemy():
	var enemy = enemy_factory.duplicate()
	spawner.add_child(enemy)
	enemy.position=Vector2(200,200)
