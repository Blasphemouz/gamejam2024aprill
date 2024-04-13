extends Control
var kiirusedasi=60
var kiirusalla=60
var võetud=false
@onready var p_kapikk = $"."


# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	var my_random_number = rng.randf_range(0,1)
	if(my_random_number>0.5):
		kiirusalla*=-1
	my_random_number = rng.randf_range(0,1)
	if(my_random_number>0.5):
		kiirusedasi*=-1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!võetud):
		var asi=Vector2(kiirusedasi*delta,kiirusalla*delta)
		p_kapikk.set_position(p_kapikk.position+asi)
		if(p_kapikk.position.x>1150 or p_kapikk.position.x<0):
			kiirusedasi*=-1
		if(p_kapikk.position.y>640 or p_kapikk.position.y<0):
			kiirusalla*=-1
	else:
		p_kapikk.set_position(get_global_mouse_position())
	
func _on_button_pressed():
	p_kapikk.get_parent().lisapäkapikk()
	if(võetud):
		võetud=false
	else:
		võetud=true
	
	#queue_free()
	#get_parent().remove_child(self)	


func _on_button_mouse_entered():
	if(rng.randf_range(0,1)>0.75):
		kiirusedasi*=-1
	if(rng.randf_range(0,1)>0.75):
		kiirusalla*=-1
	kiirusedasi*=2
	kiirusalla*=2


func _on_button_mouse_exited():
	kiirusedasi/=2
	kiirusalla/=2
