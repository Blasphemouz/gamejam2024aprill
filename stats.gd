extends Node
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
var viht3 = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	if õlu >= lapinkulta:
		return true
	else:
		return false
	
func judge_viht(viht):
	print(viht3)
	if viht >= viht3:
		Dialogic.VAR.judgment.set('viht', true)
	else:
		return false
	
func judge_päkapikk(päkapikk):
	if päkapikk >= rohelisipäkkapikke:
		return true
	else:
		return false
	
func judge_mesi(judgemesi):
	if judgemesi >= mesi:
		return true
	else:
		return false
