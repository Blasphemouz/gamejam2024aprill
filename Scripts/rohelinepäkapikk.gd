extends Control

var kiirusedasi=300
var kiirusalla=300
var võetud=false

@onready var p_kapikk = $"."
@onready var button = $Button
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var kraba_roh_p2ka = $"kraba_roh_p2ka"
@onready var p2ka_putdown = $"p2ka_putdown"

# Kursori asjad
var kursor_vajutus = load("res://assets/cursor/cursor_grabbing.png")

# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()
func _ready():
	animated_sprite_2d.play("default")
	rng.randomize()
	var my_random_number = rng.randf_range(0,1)
	if(my_random_number>0.5):
		kiirusalla*=-1
	my_random_number = rng.randf_range(0,1)
	if(my_random_number>0.5):
		kiirusedasi*=-1

func _process(delta):
	if(!võetud):
		var asi=Vector2(kiirusedasi*delta,kiirusalla*delta)
		p_kapikk.set_position(p_kapikk.position+asi)
		if(p_kapikk.position.x>get_viewport().get_visible_rect().size.x or p_kapikk.position.x<0):
			kiirusedasi*=-1
		if(p_kapikk.position.y>get_viewport().get_visible_rect().size.y*0.7 or p_kapikk.position.y<get_viewport().get_visible_rect().size.y*0.3):
			kiirusalla*=-1
	else:
		Input.set_custom_mouse_cursor(kursor_vajutus, Input.CURSOR_ARROW, Vector2(16,16))
		p_kapikk.set_position(get_global_mouse_position()+Vector2(-34,-4))
			
	
func _on_button_pressed():
	if(võetud):
		animated_sprite_2d.play("default")
		p2ka_putdown.play()
		if(p_kapikk.get_parent().getpada()):
			p_kapikk.get_parent().lisarohelinepäkapikk()
			kustuta()
			võetud=false
		võetud=false
	else:
		animated_sprite_2d.play("Pinch")
		kraba_roh_p2ka.play()
		võetud=true
	
func kustuta():
	queue_free()
	get_parent().remove_child(self)	
