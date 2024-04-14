extends Node
var päkkapikke = 0
var kollaseidpäkkapikke = 0
var siniseidpäkkapikke = 0
var rohelisipäkkapikke = 0
var mesi = 0
var jook = 0
var vesi = 0
var lapinkulta = 0
var viht1 = 0
var viht2 = 0
var viht3 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func muuda(punaseid,kollaseid, siniseid, rohelisi, mee, joo, vee, lapin, viht11, viht22, viht33):
	päkkapikke = punaseid
	kollaseidpäkkapikke = kollaseid
	siniseidpäkkapikke = siniseid
	rohelisipäkkapikke = rohelisi
	mesi = mee
	jook = joo
	vesi = vee
	lapinkulta = lapin
	viht1 = viht11
	viht2 = viht22
	viht3 = viht33

func judge_õlu(õlu):
	if ((õlu <= lapinkulta) and (jook == 0)):
		Dialogic.VAR.judgment.set('õlu', true)
	else:
		return false
	
func judge_viht(viht):
	if ((viht <= viht3) and (viht2 == 0) and (viht1 == 0)):
		Dialogic.VAR.judgment.set('viht', true)
	else:
		return false
	
func judge_päkapikk(päkapikk):
	if (päkapikk <= rohelisipäkkapikke) and (päkkapikke == 0) and (kollaseidpäkkapikke) == 0 and (siniseidpäkkapikke == 0):
		Dialogic.VAR.judgment.set('pakapikk', true)
	else:
		return false
	
func judge_mesi(judgemesi):
	if judgemesi <= mesi:
		Dialogic.VAR.judgment.set('judmesi', true)
	else:
		return false

func judgment_final(tingimus):
	if ((tingimus <= 0) and (Dialogic.VAR.judgment.get('õlu') == true) and (Dialogic.VAR.judgment.get('viht') == true) and (Dialogic.VAR.judgment.get('päkapikk') == true) and (Dialogic.VAR.judgment.get('mesi')) == true):
		Dialogic.VAR.judgment.set('tingimus', true)
	else:
		return false
func eelminestseen():
	get_tree().change_scene_to_file("res://main.tscn")
func järgminestseen():
	get_tree().change_scene_to_file("res://kollanepäkapikk.tscn")
