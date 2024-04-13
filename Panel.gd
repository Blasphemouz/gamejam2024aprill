extends Panel
@onready var pildid = $"."
@onready var texture_rect = $TextureRect
var pos


# Called when the node enters the scene tree for the first time.
func _ready():
	pos=texture_rect.position# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func lisapilt(path, pos1, mitu):
	var uus=texture_rect.duplicate()
	uus.set_position(pos1+Vector2(30*mitu,0))
	var img = load(path)
	uus.texture=img
	pildid.add_child(uus)
func lisa(mida, mitu):
	if(mitu==1):
		pos+=Vector2(0,50)
	if(mida=="punane"):
		lisapilt("res://assets/elf/elf_red_stand.png",pos, mitu)
