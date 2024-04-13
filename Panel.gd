extends Panel
@onready var pildid = $"."
@onready var texture_rect = $TextureRect
var pos
var punanepos;
var kollanepos;
var punanetekst
var kollanetekst
@onready var label = $Label
var tektpos


# Called when the node enters the scene tree for the first time.
func _ready():
	pos=texture_rect.position# Replace with function body.
	tektpos=label.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func muudatekst(tekst1, mitu):
	tekst1.text=str(mitu)+"X"
func lisa(mida, mitu):
	if(mitu==1):
		var img
		var uus=texture_rect.duplicate()
		var uustekst=label.duplicate()
		uus.set_position(pos+Vector2(30*mitu,0))
		uustekst.set_position(tektpos+Vector2(30*mitu,0))
		if(mida=="punane"):
			punanetekst=uustekst
			punanepos=pos
			img = load("res://assets/elf/elf_red_stand.png")
		if(mida=="kollane"):
			kollanetekst=uustekst
			kollanepos=pos
			img = load("res://assets/elf/elf_yellow_stand.png")
		uus.texture=img
		pos+=Vector2(0,50)
		tektpos+=Vector2(0,50)
		pildid.add_child(uus)
		pildid.add_child(uustekst)
	if(mida=="punane"):
		muudatekst(punanetekst,mitu)
	if(mida=="kollane"):
		muudatekst(kollanetekst,mitu)
