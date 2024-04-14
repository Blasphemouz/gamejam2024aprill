extends Button
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var main = $".."
@onready var nupp = $"."
var kaspeal=false
var asi
var position1;
# Called when the node enters the scene tree for the first time.
func _ready():
	position1 = nupp.position

func _process(_delta):
	if(kaspeal):
		nupp.set_position(get_global_mouse_position() + Vector2(-20, -20))


func _on_pressed():
	if(!kaspeal):
		audio_stream_player_2d.play()
		kaspeal = true
	else:
		if(main.getpada()):
			main.lisamuu(nupp)
			kaspeal = false
			nupp.set_position(position1)
		else:
			kaspeal = false
			nupp.set_position(position1)
