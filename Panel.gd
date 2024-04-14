extends Panel
@onready var pildid = $"."
@onready var texture_rect = $TextureRect
var pos

var punanetekst
var kollanetekst
var sininetekst
var rohelinetekst

@onready var label = $Label
var tektpos
var vesitekst
var jooktekst
var honeytekst
var lapinkultatekst
var viht1tekst
var viht2tekst
var viht3tekst


func _ready():
	pos = texture_rect.position
	tektpos = label.position

func _process(_delta):
	pass

func muudatekst(tekst1, mitu):
	tekst1.text = str(mitu) + "X"

func lisa(mida, mitu):
	if(mitu==1):
		var img
		var uus = texture_rect.duplicate()
		var uustekst = label.duplicate()
		
		uus.set_position(pos + Vector2(30 * mitu, 0))
		uustekst.set_position(tektpos + Vector2(30 * mitu, 0))
		
		if(mida == "punane"):
			punanetekst = uustekst
			img = load("res://assets/elf/elf_red_stand.png")
			
		if(mida == "kollane"):
			kollanetekst = uustekst
			img = load("res://assets/elf/elf_yellow_stand.png")
		
		if(mida == "sinine"):
			sininetekst = uustekst
			img = load("res://assets/elf/elf_blue_stand.png")
		
		if(mida == "roheline"):
			rohelinetekst = uustekst
			img = load("res://assets/elf/elf_green_stand.png")
		
		if(mida == "vesi"):
			vesitekst=uustekst
			img = load("res://assets/cooking sim/water.png")
			
		if(mida == "jook"):
			jooktekst = uustekst
			img = load("res://assets/cooking sim/‰llenaut.png")
			
		if(mida == "honey"):
			honeytekst = uustekst
			img = load("res://assets/cooking sim/honey.png")
			
		if(mida == "lapinkulta"):
			lapinkultatekst=uustekst
			img = load("res://assets/cooking sim/lapinkulta.png")
		
		if(mida == "viht1"):
			viht1tekst=uustekst
			img = load("res://assets/vihad/viht 1.png")
			
		if(mida == "viht2"):
			viht2tekst=uustekst
			img = load("res://assets/vihad/viht 2.png")
		
		if(mida == "viht3"):
			viht3tekst=uustekst
			img = load("res://assets/vihad/viht 3.png")
			
		uus.texture = img
		pos += Vector2(0, 50)
		tektpos += Vector2(0, 50)
		
		pildid.add_child(uus)
		pildid.add_child(uustekst)
		
	if(mida == "punane"):
		muudatekst(punanetekst, mitu)
		
	if(mida == "kollane"):
		muudatekst(kollanetekst, mitu)
		
	if (mida == "sinine"):
		muudatekst(sininetekst, mitu)
	
	if (mida == "roheline"):
		muudatekst(rohelinetekst, mitu) 
		
	if(mida == "vesi"):
		muudatekst(vesitekst, mitu)
		
	if(mida == "jook"):
		muudatekst(jooktekst, mitu)
		
	if(mida == "honey"):
		muudatekst(honeytekst, mitu)
		
	if(mida == "lapinkulta"):
		muudatekst(lapinkultatekst, mitu)
	
	if(mida == "viht1"):
		muudatekst(viht1tekst, mitu)
		
	if(mida == "viht2"):
		muudatekst(viht2tekst, mitu)
		
	if(mida == "viht3"):
		muudatekst(viht3tekst, mitu)
